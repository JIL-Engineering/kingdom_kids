import 'dart:io';

import 'package:csv/csv.dart';
import 'package:postgres/postgres.dart';

/// Reads a book-import CSV (see content/README.md for the column spec) and
/// writes Book/BookTranslation/Page/PageContent rows to Postgres.
///
/// Not Serverpod code -- a standalone script, per docs/09_sprint2_plan.md.
/// Re-running with the same slugs/page numbers is safe: books and pages
/// upsert on their unique keys instead of duplicating.
Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run bin/import_books.dart <path-to-csv>');
    exit(1);
  }

  final csvFile = File(args[0]);
  if (!csvFile.existsSync()) {
    stderr.writeln('CSV not found: ${args[0]}');
    exit(1);
  }

  final host = Platform.environment['DB_HOST'] ?? 'localhost';
  final port = int.parse(Platform.environment['DB_PORT'] ?? '8090');
  final database = Platform.environment['DB_NAME'] ?? 'kingdom_kids';
  final username = Platform.environment['DB_USER'] ?? 'postgres';
  final password = Platform.environment['DB_PASSWORD'];
  if (password == null) {
    stderr.writeln(
      'Set the DB_PASSWORD environment variable '
      '(see kingdom_kids_server/docker-compose.yaml for the local dev value).',
    );
    exit(1);
  }

  // Normalize line endings before parsing -- a hand-edited CSV commonly uses
  // bare LF, while a Google Sheets CSV export uses CRLF. The csv package
  // expects one fixed eol, so pick LF and normalize to it up front rather
  // than requiring a specific source convention.
  final normalizedCsv = (await csvFile.readAsString()).replaceAll(
    '\r\n',
    '\n',
  );
  final rows = const CsvToListConverter(
    eol: '\n',
    shouldParseNumbers: false,
  ).convert(normalizedCsv);
  if (rows.length < 2) {
    stderr.writeln('CSV has no data rows.');
    exit(1);
  }

  final header = rows.first.map((cell) => cell.toString().trim()).toList();
  int col(String name) {
    final index = header.indexOf(name);
    if (index == -1) throw StateError('Missing required column: $name');
    return index;
  }

  final slugCol = col('slug');
  final titleEnCol = col('title_en');
  final titleFrCol = col('title_fr');
  final categoryCol = col('category');
  final ageMinCol = col('age_bracket_min');
  final ageMaxCol = col('age_bracket_max');
  final pageNumberCol = col('page_number');
  final textEnCol = col('text_en');
  final textFrCol = col('text_fr');
  final illustrationCol = col('illustration_filename');
  final audioEnCol = col('audio_filename_en');
  final audioFrCol = col('audio_filename_fr');

  // Group data rows by book slug, preserving first-seen order.
  final slugOrder = <String>[];
  final rowsBySlug = <String, List<List<dynamic>>>{};
  for (final row in rows.skip(1)) {
    if (row.every((cell) => cell.toString().trim().isEmpty)) continue;
    final slug = row[slugCol].toString().trim();
    (rowsBySlug[slug] ??= []).add(row);
    if (!slugOrder.contains(slug)) slugOrder.add(slug);
  }

  final connection = await Connection.open(
    Endpoint(
      host: host,
      port: port,
      database: database,
      username: username,
      password: password,
    ),
    settings: const ConnectionSettings(sslMode: SslMode.disable),
  );

  var bookCount = 0;
  var pageCount = 0;

  for (final slug in slugOrder) {
    final bookRows = rowsBySlug[slug]!;
    final first = bookRows.first;

    await connection.runTx((tx) async {
      final bookResult = await tx.execute(
        Sql.named('''
          insert into books
            (slug, "ageBracketMin", "ageBracketMax", category, "isPublished", "contentVersion", "updatedAt", "createdAt")
          values
            (@slug, @ageMin, @ageMax, @category, true, 1, now(), now())
          on conflict (slug) do update set
            "ageBracketMin" = excluded."ageBracketMin",
            "ageBracketMax" = excluded."ageBracketMax",
            category = excluded.category,
            "updatedAt" = now()
          returning id
        '''),
        parameters: {
          'slug': slug,
          'ageMin': first[ageMinCol].toString().trim(),
          'ageMax': first[ageMaxCol].toString().trim(),
          'category': first[categoryCol].toString().trim(),
        },
      );
      final bookId = bookResult.first[0] as int;

      for (final language in ['en', 'fr']) {
        final title = (language == 'en' ? first[titleEnCol] : first[titleFrCol])
            .toString()
            .trim();
        await tx.execute(
          Sql.named('''
            insert into book_translations ("bookId", language, title)
            values (@bookId, @language, @title)
            on conflict ("bookId", language) do update set title = excluded.title
          '''),
          parameters: {
            'bookId': bookId,
            'language': language,
            'title': title,
          },
        );
      }

      for (final row in bookRows) {
        final pageNumber = int.parse(row[pageNumberCol].toString().trim());
        final illustration = row[illustrationCol].toString().trim();

        final pageResult = await tx.execute(
          Sql.named('''
            insert into pages ("bookId", "pageNumber", "illustrationAsset", "layoutType")
            values (@bookId, @pageNumber, @illustration, 'default')
            on conflict ("bookId", "pageNumber") do update set
              "illustrationAsset" = excluded."illustrationAsset"
            returning id
          '''),
          parameters: {
            'bookId': bookId,
            'pageNumber': pageNumber,
            'illustration': illustration,
          },
        );
        final pageId = pageResult.first[0] as int;

        for (final language in ['en', 'fr']) {
          final text = (language == 'en' ? row[textEnCol] : row[textFrCol])
              .toString()
              .trim();
          final audio = (language == 'en' ? row[audioEnCol] : row[audioFrCol])
              .toString()
              .trim();
          await tx.execute(
            Sql.named('''
              insert into page_contents ("pageId", language, text, "audioAsset")
              values (@pageId, @language, @text, @audio)
              on conflict ("pageId", language) do update set
                text = excluded.text,
                "audioAsset" = excluded."audioAsset"
            '''),
            parameters: {
              'pageId': pageId,
              'language': language,
              'text': text,
              'audio': audio,
            },
          );
        }
        pageCount++;
      }
    });
    bookCount++;
  }

  await connection.close();
  // ignore: avoid_print
  print('Imported $bookCount book(s), $pageCount page(s) from ${csvFile.path}.');
}
