import 'package:serverpod/serverpod.dart'; // Classes de base Serverpod (Endpoint, Session, etc.)
import '../generated/protocol.dart'; // Import des classes générées : Book, Page, PageContent, BookSummary, BookDetail, BookPage

class LibraryEndpoint extends Endpoint {
  // browseBooks : renvoie une liste résumée de livres filtrés par tranche d'âge / langue / catégorie
  Future<List<BookSummary>> browseBooks(
    Session
    session, { // Session : contexte Serverpod (accès DB, auth, etc.), toujours 1er paramètre
    int?
    ageBracket, // Âge de l'enfant (optionnel) pour filtrer les livres adaptés
    String?
    language, // Langue souhaitée (optionnel) pour ne garder que les livres traduits
    String? category, // Catégorie du livre (optionnel)
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

    final filtered = books.where((book) {
      // Filtrage en mémoire (Dart) sur les résultats déjà récupérés de la DB
      if (allowedBookIds != null && !allowedBookIds.contains(book.id)) {
        return false; // Si un filtre langue existe et que ce livre n'en fait pas partie -> exclu
      }
      if (ageBracket != null) {
        // Si un âge est fourni, on vérifie qu'il tombe dans la tranche du livre
        final min = int.tryParse(
          book.ageBracketMin,
        ); // Conversion String -> int (renvoie null si non convertible)
        final max = int.tryParse(book.ageBracketMax);
        if (min != null && max != null) {
          // On ne peut comparer que si les deux valeurs sont bien numériques
          if (ageBracket < min || ageBracket > max)
            return false; // Hors tranche -> exclu
        }
      }
      return true; // Le livre passe tous les filtres -> inclus
    });

    return filtered
        .map(
          (book) => BookSummary(
            // Transformation Book (modèle DB complet) -> BookSummary (modèle allégé exposé au client)
            id: book
                .id!, // `!` : on affirme que id n'est pas null (un livre lu en DB en a toujours un)
            slug: book.slug,
            ageBracketMin: book.ageBracketMin,
            ageBracketMax: book.ageBracketMax,
            category: book.category,
            coverImageAsset: book.coverImageAsset,
          ),
        )
        .toList(); // Le Map<> est "lazy", .toList() force le calcul et fige le résultat
  }

  // getBook : renvoie le détail complet d'un livre pour une langue donnée (toutes ses pages + textes traduits)
  Future<BookDetail> getBook(
    Session session,
    int bookId, // Id du livre demandé (paramètre obligatoire)
    String language, // Langue demandée (obligatoire, pas de fallback ici)
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
      if (content == null)
        continue; // Pas de traduction dans cette langue -> on saute cette page
      bookPages.add(
        BookPage(
          // Sinon on construit l'objet combiné page+contenu
          pageNumber: page.pageNumber,
          illustrationAsset: page.illustrationAsset,
          layoutType: page.layoutType,
          text: content.text,
          audioAsset: content.audioAsset,
        ),
      );
    }

    return BookDetail(
      // Construction de l'objet final renvoyé au client
      id: book.id!,
      slug: book.slug,
      ageBracketMin: book.ageBracketMin,
      ageBracketMax: book.ageBracketMax,
      category: book.category,
      coverImageAsset: book.coverImageAsset,
      pages: bookPages,
    );
  }
}
