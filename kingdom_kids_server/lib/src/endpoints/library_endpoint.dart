import 'package:serverpod/serverpod.dart'; // Classes de base Serverpod (Endpoint, Session, etc.)
import '../generated/protocol.dart'; // Import des classes générées : Book, Page, PageContent, BookSummary, BookDetail, BookPage
import '../services/asset_url_service.dart';

class LibraryEndpoint extends Endpoint {
  // browseBooks : renvoie une liste résumée de livres filtrés par tranche d'âge / langue / catégorie
  Future<List<BookSummary>> browseBooks(
    Session
    session, { // Session : contexte Serverpod (accès DB, auth, etc.), toujours 1er paramètre
    AgeBracket? ageBracket,
    AppLanguage? language,
    BookCategory? category,
  }) async {
    Set<int>?
    allowedBookIds; // Sera rempli seulement si `language` est fourni ; null = "pas de filtre langue"

    if (language != null) {
      // On n'entre ici que si l'appelant a demandé une langue précise
      final contents = await PageContent.db.find(
        // Requête SQL : SELECT * FROM page_contents WHERE language = ...
        session, // La session porte la connexion DB
        where: (t) => t.language.equals(
          language,
        ), // `t` = la table page_contents ; on filtre sur la colonne language
      );
      final pageIds = contents
          .map((c) => c.pageId)
          .toSet(); // On extrait les pageId des contenus trouvés (dédupliqués via Set)

      final pages = await Page.db.find(
        // Deuxième requête : quelles pages (et donc quels livres) ont cette langue
        session,
        where: (t) => t.id.inSet(
          pageIds,
        ), // On cherche les pages dont l'id est dans pageIds
      );
      allowedBookIds = pages
          .map((p) => p.bookId)
          .toSet(); // On remonte au bookId de chaque page -> livres qui ont cette langue
    }

    final books = await Book.db.find(
      // Requête principale : tous les livres publiés (et catégorie si fournie)
      session,
      where: (t) {
        // Construction dynamique de la clause WHERE
        var condition = t.isPublished.equals(
          true,
        ); // Condition de base : isPublished = true (jamais montrer un brouillon)
        if (category != null) {
          // Si une catégorie est demandée...
          condition =
              condition &
              t.category.equals(
                category,
              ); // ...on l'ajoute avec un ET logique (&)
        }
        return condition; // On renvoie la condition finale au générateur de requête
      },
    );
    final translations = await BookTranslation.db.find(
      session,
      where: language == null
          ? null
          : (t) => t.language.equals(language.name),
    );
    final titleByBookId = {
      for (final translation in translations)
        translation.bookId: translation.title,
    };

    final filtered = books.where((book) {
      // Filtrage en mémoire (Dart) sur les résultats déjà récupérés de la DB
      if (allowedBookIds != null && !allowedBookIds.contains(book.id)) {
        return false; // Si un filtre langue existe et que ce livre n'en fait pas partie -> exclu
      }
      if (ageBracket != null &&
          (ageBracket.index < book.ageBracketMin.index ||
              ageBracket.index > book.ageBracketMax.index)) {
        return false;
      }
      return true; // Le livre passe tous les filtres -> inclus
    });

    return await Future.wait(
      filtered.map(
        (book) async => BookSummary(
            // Transformation Book (modèle DB complet) -> BookSummary (modèle allégé exposé au client)
            id: book
                .id!, // `!` : on affirme que id n'est pas null (un livre lu en DB en a toujours un)
            slug: book.slug,
            title: titleByBookId[book.id!] ??
                (throw StateError(
                  'Book translation not found: ${book.id}',
                )),
            ageBracketMin: book.ageBracketMin,
            ageBracketMax: book.ageBracketMax,
            category: book.category,
            coverImageAsset: await AssetUrlService.nullablePublicUrl(
              session,
              book.coverImageAsset,
            ),
          ),
        ),
    );
  }

  // getBook : renvoie le détail complet d'un livre pour une langue donnée (toutes ses pages + textes traduits)
  Future<BookDetail> getBook(
    Session session,
    int bookId, // Id du livre demandé (paramètre obligatoire)
    AppLanguage language,
  ) async {
    final book = await Book.db.findById(
      session,
      bookId,
    ); // Recherche directe par clé primaire (plus rapide qu'un find + where)
    if (book == null) {
      // findById renvoie null si l'id n'existe pas
      throw Exception(
        'Book not found: $bookId',
      ); // On stoppe l'exécution avec une erreur explicite
    }
    final translation = await BookTranslation.db.findFirstRow(
      session,
      where: (t) =>
          t.bookId.equals(bookId) & t.language.equals(language.name),
    );
    if (translation == null) {
      throw StateError(
        'Book translation not found for language ${language.name}: $bookId',
      );
    }

    final pages = await Page.db.find(
      // Récupère toutes les pages du livre
      session,
      where: (t) => t.bookId.equals(bookId),
      orderBy: (t) =>
          t.pageNumber, // Tri par numéro de page pour garder l'ordre de lecture
    );

    final pageIds = pages.map((p) => p.id!).toSet();
    final contents = await PageContent.db.find(
      // Récupère les traductions correspondant à ces pages ET cette langue
      session,
      where: (t) => t.pageId.inSet(pageIds) & t.language.equals(language),
    );
    final contentByPageId = {
      for (var c in contents) c.pageId: c,
    }; // Transforme la liste en Map pageId -> contenu pour un accès O(1)

    final bookPages =
        <
          BookPage
        >[]; // Liste finale qui combinera Page (structure) + PageContent (texte/audio)
    for (final page in pages) {
      // On boucle sur les pages dans l'ordre déjà trié
      final content =
          contentByPageId[page
              .id]; // On cherche si une traduction existe pour cette page
      if (content == null) {
        continue; // Pas de traduction dans cette langue -> on saute cette page
      }
      bookPages.add(
        BookPage(
          // Sinon on construit l'objet combiné page+contenu
          pageNumber: page.pageNumber,
          illustrationAsset: await AssetUrlService.publicUrl(
            session,
            page.illustrationAsset,
          ),
          layoutType: page.layoutType,
          text: content.text,
          audioAsset: await AssetUrlService.publicUrl(
            session,
            content.audioAsset,
          ),
        ),
      );
    }

    return BookDetail(
      // Construction de l'objet final renvoyé au client
      id: book.id!,
      slug: book.slug,
      title: translation.title,
      ageBracketMin: book.ageBracketMin,
      ageBracketMax: book.ageBracketMax,
      category: book.category,
      coverImageAsset: await AssetUrlService.nullablePublicUrl(
        session,
        book.coverImageAsset,
      ),
      pages: bookPages,
    );
  }
}
