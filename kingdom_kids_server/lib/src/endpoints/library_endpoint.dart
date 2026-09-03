import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../services/asset_url_service.dart';

class LibraryEndpoint extends Endpoint {
  // browseBooks — VERSION OPTIMISÉE
  // Le filtre langue reste nécessairement en 2 requêtes (PageContent -> Book),
  // car il n'y a pas de lien direct langue sur la table Book elle-même.
  // En revanche, le filtre ageBracket passe maintenant en SQL plutôt qu'en mémoire,
  // et category était déjà en SQL (inchangé).
  Future<List<BookSummary>> browseBooks(
    Session session, {
    AgeBracket? ageBracket,
    AppLanguage? language,
    BookCategory? category,
  }) async {
    Set<int>? allowedBookIds;

    if (language != null) {
      final contents = await PageContent.db.find(
        session,
        where: (t) => t.language.equals(language),
      );
      final pageIds = contents.map((c) => c.pageId).toSet();

      final pages = await Page.db.find(
        session,
        where: (t) => t.id.inSet(pageIds),
      );
      allowedBookIds = pages.map((p) => p.bookId).toSet();

      // Si le filtre langue ne retient aucun livre, inutile d'interroger Book du tout
      if (allowedBookIds.isEmpty) return [];
    }

    final books = await Book.db.find(
      session,
      where: (t) {
        var condition = t.isPublished.equals(true);
        if (category != null) {
          condition = condition & t.category.equals(category);
        }
        if (allowedBookIds != null) {
          condition = condition & t.id.inSet(allowedBookIds);
        }
        // Filtre ageBracket désormais en SQL : le livre doit couvrir la tranche demandée
        // (ageBracketMin <= ageBracket <= ageBracketMax)
        if (ageBracket != null) {
          condition =
              condition &
              t.ageBracketMin.inSet(
                AgeBracket.values
                    .where((a) => a.index <= ageBracket.index)
                    .toSet(),
              ) &
              t.ageBracketMax.inSet(
                AgeBracket.values
                    .where((a) => a.index >= ageBracket.index)
                    .toSet(),
              );
        }
        return condition;
      },
    );

    final bookIds = books.map((b) => b.id!).toSet();
    final translations = await BookTranslation.db.find(
      session,
      where: (t) =>
          t.bookId.inSet(bookIds) &
          (language == null
              ? Constant.bool(true)
              : t.language.equals(language)),
    );
    final titleByBookId = {
      for (final translation in translations)
        translation.bookId: translation.title,
    };

    return await Future.wait(
      books.map(
        (book) async => BookSummary(
          id: book.id!,
          slug: book.slug,
          title:
              titleByBookId[book.id!] ??
              (throw StateError('Book translation not found: ${book.id}')),
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

  // getBook — INCHANGÉ (déjà propre)
  Future<BookDetail> getBook(
    Session session,
    int bookId,
    AppLanguage language,
  ) async {
    final book = await Book.db.findById(session, bookId);
    if (book == null) {
      throw Exception('Book not found: $bookId');
    }
    final translation = await BookTranslation.db.findFirstRow(
      session,
      where: (t) => t.bookId.equals(bookId) & t.language.equals(language),
    );
    if (translation == null) {
      throw StateError(
        'Book translation not found for language ${language.name}: $bookId',
      );
    }

    final pages = await Page.db.find(
      session,
      where: (t) => t.bookId.equals(bookId),
      orderBy: (t) => t.pageNumber,
    );

    final pageIds = pages.map((p) => p.id!).toSet();
    final contents = await PageContent.db.find(
      session,
      where: (t) => t.pageId.inSet(pageIds) & t.language.equals(language),
    );
    final contentByPageId = {for (var c in contents) c.pageId: c};

    final bookPages = <BookPage>[];
    for (final page in pages) {
      final content = contentByPageId[page.id];
      if (content == null) {
        throw StateError(
          'Page translation not found for language ${language.name}: ${page.id}',
        );
      }
      bookPages.add(
        BookPage(
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

  // getDownloadBundle — NOUVEAU
  // NOTE: utilise pour l'instant AssetUrlService.publicUrl (URLs publiques, non expirantes),
  // car AssetUrlService.signedUrl n'existe pas encore — voir le TODO dans asset_url_service.dart
  // (SigV4 R2 à implémenter séparément, probablement lié à la tâche R2 de Sterelle).
  // À remplacer par de vraies URLs signées temporaires une fois cette infra prête.
  Future<DownloadBundle> getDownloadBundle(
    Session session,
    int bookId,
    AppLanguage language,
  ) async {
    final book = await Book.db.findById(session, bookId);
    if (book == null) {
      throw Exception('Book not found: $bookId');
    }

    final pages = await Page.db.find(
      session,
      where: (t) => t.bookId.equals(bookId),
      orderBy: (t) => t.pageNumber,
    );
    final pageIds = pages.map((p) => p.id!).toSet();
    final contents = await PageContent.db.find(
      session,
      where: (t) => t.pageId.inSet(pageIds) & t.language.equals(language),
    );
    final contentByPageId = {for (var c in contents) c.pageId: c};

    final assets = <DownloadAsset>[];

    if (book.coverImageAsset != null) {
      assets.add(
        DownloadAsset(
          assetKey: book.coverImageAsset!,
          url: await AssetUrlService.publicUrl(session, book.coverImageAsset!),
        ),
      );
    }

    for (final page in pages) {
      final content = contentByPageId[page.id];
      assets.add(
        DownloadAsset(
          assetKey: page.illustrationAsset,
          url: await AssetUrlService.publicUrl(session, page.illustrationAsset),
        ),
      );
      if (content != null) {
        assets.add(
          DownloadAsset(
            assetKey: content.audioAsset,
            url: await AssetUrlService.publicUrl(session, content.audioAsset),
          ),
        );
      }
    }

    return DownloadBundle(
      bookId: bookId,
      contentVersion: book.contentVersion,
      assets: assets,
    );
  }

  // getRecommended — NOUVEAU
  // Logique MVP simple : livres publiés, dans la tranche d'âge de l'enfant,
  // que l'enfant n'a pas encore commencés, triés par date de création (plus récents en premier).
  // Pas de scoring/ML pour le MVP — à faire évoluer plus tard si besoin.
  //
  // NOTE: ChildProfile.preferredLanguage est un String (pas un AppLanguage comme
  // PageContent.language / BookTranslation.language) — incohérence de schéma à signaler
  // au tech lead pour uniformisation future. Conversion faite ici en attendant.
  Future<List<BookSummary>> getRecommended(
    Session session,
    int childId, {
    int limit = 10,
  }) async {
    final child = await ChildProfile.db.findById(session, childId);
    if (child == null) {
      throw Exception('Child not found: $childId');
    }

    final childLanguage = AppLanguage.values.firstWhere(
      (l) => l.name == child.preferredLanguage,
      orElse: () => AppLanguage.en,
    );

    final startedProgress = await ReadingProgress.db.find(
      session,
      where: (t) => t.childId.equals(childId),
    );
    final startedBookIds = startedProgress.map((p) => p.bookId).toSet();

    final books = await Book.db.find(
      session,
      where: (t) {
        var condition =
            t.isPublished.equals(true) &
            t.ageBracketMin.inSet(
              AgeBracket.values
                  .where((a) => a.index <= child.ageBracket.index)
                  .toSet(),
            ) &
            t.ageBracketMax.inSet(
              AgeBracket.values
                  .where((a) => a.index >= child.ageBracket.index)
                  .toSet(),
            );
        if (startedBookIds.isNotEmpty) {
          condition = condition & t.id.notInSet(startedBookIds);
        }
        return condition;
      },
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
    );

    final bookIds = books.map((b) => b.id!).toSet();
    final translations = await BookTranslation.db.find(
      session,
      where: (t) => t.bookId.inSet(bookIds) & t.language.equals(childLanguage),
    );
    final titleByBookId = {
      for (final translation in translations)
        translation.bookId: translation.title,
    };

    return await Future.wait(
      books.map(
        (book) async => BookSummary(
          id: book.id!,
          slug: book.slug,
          title:
              titleByBookId[book.id!] ??
              (throw StateError('Book translation not found: ${book.id}')),
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

  // checkForUpdates — NOUVEAU
  // Retourne les livres créés OU modifiés depuis lastSyncedAt, pour que le client
  // sache quoi re-télécharger sans devoir tout recomparer lui-même.
  //
  // CORRECTION: ColumnDateTime n'a pas de méthode .greaterThan() dans cette version
  // de Serverpod — utilisation de l'opérateur > à la place.
  Future<List<BookSummary>> checkForUpdates(
    Session session,
    DateTime lastSyncedAt,
    AppLanguage language,
  ) async {
    final books = await Book.db.find(
      session,
      where: (t) => t.isPublished.equals(true) & (t.updatedAt > lastSyncedAt),
      orderBy: (t) => t.updatedAt,
    );

    final bookIds = books.map((b) => b.id!).toSet();
    final translations = await BookTranslation.db.find(
      session,
      where: (t) => t.bookId.inSet(bookIds) & t.language.equals(language),
    );
    final titleByBookId = {
      for (final translation in translations)
        translation.bookId: translation.title,
    };

    return await Future.wait(
      books.map(
        (book) async => BookSummary(
          id: book.id!,
          slug: book.slug,
          title:
              titleByBookId[book.id!] ??
              (throw StateError('Book translation not found: ${book.id}')),
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
}
