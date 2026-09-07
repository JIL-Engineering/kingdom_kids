/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'age_bracket.dart' as _i5;
import 'app_language.dart' as _i6;
import 'app_user.dart' as _i7;
import 'auth_response.dart' as _i8;
import 'badge.dart' as _i9;
import 'book.dart' as _i10;
import 'book_category.dart' as _i11;
import 'book_detail.dart' as _i12;
import 'book_page.dart' as _i13;
import 'book_summary.dart' as _i14;
import 'book_translation.dart' as _i15;
import 'child_badge.dart' as _i16;
import 'child_profile.dart' as _i17;
import 'devotional.dart' as _i18;
import 'devotional_translation.dart' as _i19;
import 'download_asset.dart' as _i20;
import 'download_bundle.dart' as _i21;
import 'download_record.dart' as _i22;
import 'greetings/greeting.dart' as _i23;
import 'page.dart' as _i24;
import 'page_content.dart' as _i25;
import 'reading_progress.dart' as _i26;
import 'package:kingdom_kids_server/src/generated/child_profile.dart' as _i27;
import 'package:kingdom_kids_server/src/generated/book_summary.dart' as _i28;
export 'age_bracket.dart';
export 'app_language.dart';
export 'app_user.dart';
export 'auth_response.dart';
export 'badge.dart';
export 'book.dart';
export 'book_category.dart';
export 'book_detail.dart';
export 'book_page.dart';
export 'book_summary.dart';
export 'book_translation.dart';
export 'child_badge.dart';
export 'child_profile.dart';
export 'devotional.dart';
export 'devotional_translation.dart';
export 'download_asset.dart';
export 'download_bundle.dart';
export 'download_record.dart';
export 'greetings/greeting.dart';
export 'page.dart';
export 'page_content.dart';
export 'reading_progress.dart';

class Protocol extends _i1.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'badges',
      dartName: 'Badge',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'iconAsset',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'triggerRule',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'badges_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'code',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'book_translations',
      dartName: 'BookTranslation',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'bookId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'language',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:AppLanguage',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'book_translations_fk_0',
          columns: ['bookId'],
          referenceTable: 'books',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'book_translations_book_language_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bookId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'language',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'books',
      dartName: 'Book',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'slug',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ageBracketMin',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:AgeBracket',
        ),
        _i2.ColumnDefinition(
          name: 'ageBracketMax',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:AgeBracket',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:BookCategory',
        ),
        _i2.ColumnDefinition(
          name: 'coverImageAsset',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isPublished',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'contentVersion',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'books_slug_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'slug',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'child_badges',
      dartName: 'ChildBadge',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'childId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'badgeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'earnedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'child_badges_fk_0',
          columns: ['childId'],
          referenceTable: 'child_profiles',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'child_badges_fk_1',
          columns: ['badgeId'],
          referenceTable: 'badges',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'child_badges_child_badge_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'childId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'badgeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'child_profiles',
      dartName: 'ChildProfile',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'parentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'displayName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'birthYear',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ageBracket',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:AgeBracket',
        ),
        _i2.ColumnDefinition(
          name: 'preferredLanguage',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'avatarId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'pinProtected',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'child_profiles_fk_0',
          columns: ['parentId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'idx_child_profiles_parent',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'parentId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'devotional_translations',
      dartName: 'DevotionalTranslation',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'devotionalId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'language',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'verseReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'verseText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'thoughtText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'prayerPrompt',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'devotional_translations_fk_0',
          columns: ['devotionalId'],
          referenceTable: 'devotionals',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'devotional_translations_devotional_language_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'devotionalId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'language',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'devotionals',
      dartName: 'Devotional',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'devotionals_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'download_records',
      dartName: 'DownloadRecord',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random',
        ),
        _i2.ColumnDefinition(
          name: 'childId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'bookId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'deviceId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'downloadedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'download_records_fk_0',
          columns: ['childId'],
          referenceTable: 'child_profiles',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'download_records_fk_1',
          columns: ['bookId'],
          referenceTable: 'books',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'idx_downloads_child_book',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'childId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bookId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'page_contents',
      dartName: 'PageContent',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'pageId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'language',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:AppLanguage',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'audioAsset',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'page_contents_fk_0',
          columns: ['pageId'],
          referenceTable: 'pages',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'page_contents_page_language_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'pageId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'language',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'pages',
      dartName: 'Page',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'bookId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'pageNumber',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'illustrationAsset',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'layoutType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'pages_fk_0',
          columns: ['bookId'],
          referenceTable: 'books',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'idx_pages_book',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bookId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'pages_book_number_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bookId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'pageNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'reading_progress',
      dartName: 'ReadingProgress',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random',
        ),
        _i2.ColumnDefinition(
          name: 'childId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'bookId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'currentPage',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'completed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'completedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'totalTimeSeconds',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'syncedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'reading_progress_fk_0',
          columns: ['childId'],
          referenceTable: 'child_profiles',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'reading_progress_fk_1',
          columns: ['bookId'],
          referenceTable: 'books',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'idx_progress_child_book',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'childId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bookId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'idx_progress_child_started',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'childId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'startedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'users',
      dartName: 'AppUser',
      schema: 'public',
      module: 'kingdom_kids',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _i2.ColumnDefinition(
          name: 'authUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'country',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'timezone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'preferredLanguage',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'consentGivenAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'parentPinHash',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'users_fk_0',
          columns: ['authUserId'],
          referenceTable: 'serverpod_auth_core_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'users_auth_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.AgeBracket) {
      return _i5.AgeBracket.fromJson(data) as T;
    }
    if (t == _i6.AppLanguage) {
      return _i6.AppLanguage.fromJson(data) as T;
    }
    if (t == _i7.AppUser) {
      return _i7.AppUser.fromJson(data) as T;
    }
    if (t == _i8.AuthResponse) {
      return _i8.AuthResponse.fromJson(data) as T;
    }
    if (t == _i9.Badge) {
      return _i9.Badge.fromJson(data) as T;
    }
    if (t == _i10.Book) {
      return _i10.Book.fromJson(data) as T;
    }
    if (t == _i11.BookCategory) {
      return _i11.BookCategory.fromJson(data) as T;
    }
    if (t == _i12.BookDetail) {
      return _i12.BookDetail.fromJson(data) as T;
    }
    if (t == _i13.BookPage) {
      return _i13.BookPage.fromJson(data) as T;
    }
    if (t == _i14.BookSummary) {
      return _i14.BookSummary.fromJson(data) as T;
    }
    if (t == _i15.BookTranslation) {
      return _i15.BookTranslation.fromJson(data) as T;
    }
    if (t == _i16.ChildBadge) {
      return _i16.ChildBadge.fromJson(data) as T;
    }
    if (t == _i17.ChildProfile) {
      return _i17.ChildProfile.fromJson(data) as T;
    }
    if (t == _i18.Devotional) {
      return _i18.Devotional.fromJson(data) as T;
    }
    if (t == _i19.DevotionalTranslation) {
      return _i19.DevotionalTranslation.fromJson(data) as T;
    }
    if (t == _i20.DownloadAsset) {
      return _i20.DownloadAsset.fromJson(data) as T;
    }
    if (t == _i21.DownloadBundle) {
      return _i21.DownloadBundle.fromJson(data) as T;
    }
    if (t == _i22.DownloadRecord) {
      return _i22.DownloadRecord.fromJson(data) as T;
    }
    if (t == _i23.Greeting) {
      return _i23.Greeting.fromJson(data) as T;
    }
    if (t == _i24.Page) {
      return _i24.Page.fromJson(data) as T;
    }
    if (t == _i25.PageContent) {
      return _i25.PageContent.fromJson(data) as T;
    }
    if (t == _i26.ReadingProgress) {
      return _i26.ReadingProgress.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.AgeBracket?>()) {
      return (data != null ? _i5.AgeBracket.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AppLanguage?>()) {
      return (data != null ? _i6.AppLanguage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AppUser?>()) {
      return (data != null ? _i7.AppUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.AuthResponse?>()) {
      return (data != null ? _i8.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Badge?>()) {
      return (data != null ? _i9.Badge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Book?>()) {
      return (data != null ? _i10.Book.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.BookCategory?>()) {
      return (data != null ? _i11.BookCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.BookDetail?>()) {
      return (data != null ? _i12.BookDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.BookPage?>()) {
      return (data != null ? _i13.BookPage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.BookSummary?>()) {
      return (data != null ? _i14.BookSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.BookTranslation?>()) {
      return (data != null ? _i15.BookTranslation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.ChildBadge?>()) {
      return (data != null ? _i16.ChildBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ChildProfile?>()) {
      return (data != null ? _i17.ChildProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Devotional?>()) {
      return (data != null ? _i18.Devotional.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.DevotionalTranslation?>()) {
      return (data != null ? _i19.DevotionalTranslation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.DownloadAsset?>()) {
      return (data != null ? _i20.DownloadAsset.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.DownloadBundle?>()) {
      return (data != null ? _i21.DownloadBundle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.DownloadRecord?>()) {
      return (data != null ? _i22.DownloadRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Greeting?>()) {
      return (data != null ? _i23.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Page?>()) {
      return (data != null ? _i24.Page.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.PageContent?>()) {
      return (data != null ? _i25.PageContent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.ReadingProgress?>()) {
      return (data != null ? _i26.ReadingProgress.fromJson(data) : null) as T;
    }
    if (t == List<_i13.BookPage>) {
      return (data as List).map((e) => deserialize<_i13.BookPage>(e)).toList()
          as T;
    }
    if (t == List<_i20.DownloadAsset>) {
      return (data as List)
              .map((e) => deserialize<_i20.DownloadAsset>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.ChildProfile>) {
      return (data as List)
              .map((e) => deserialize<_i27.ChildProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.BookSummary>) {
      return (data as List)
              .map((e) => deserialize<_i28.BookSummary>(e))
              .toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.AgeBracket => 'AgeBracket',
      _i6.AppLanguage => 'AppLanguage',
      _i7.AppUser => 'AppUser',
      _i8.AuthResponse => 'AuthResponse',
      _i9.Badge => 'Badge',
      _i10.Book => 'Book',
      _i11.BookCategory => 'BookCategory',
      _i12.BookDetail => 'BookDetail',
      _i13.BookPage => 'BookPage',
      _i14.BookSummary => 'BookSummary',
      _i15.BookTranslation => 'BookTranslation',
      _i16.ChildBadge => 'ChildBadge',
      _i17.ChildProfile => 'ChildProfile',
      _i18.Devotional => 'Devotional',
      _i19.DevotionalTranslation => 'DevotionalTranslation',
      _i20.DownloadAsset => 'DownloadAsset',
      _i21.DownloadBundle => 'DownloadBundle',
      _i22.DownloadRecord => 'DownloadRecord',
      _i23.Greeting => 'Greeting',
      _i24.Page => 'Page',
      _i25.PageContent => 'PageContent',
      _i26.ReadingProgress => 'ReadingProgress',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'kingdom_kids.',
        '',
      );
    }

    switch (data) {
      case _i5.AgeBracket():
        return 'AgeBracket';
      case _i6.AppLanguage():
        return 'AppLanguage';
      case _i7.AppUser():
        return 'AppUser';
      case _i8.AuthResponse():
        return 'AuthResponse';
      case _i9.Badge():
        return 'Badge';
      case _i10.Book():
        return 'Book';
      case _i11.BookCategory():
        return 'BookCategory';
      case _i12.BookDetail():
        return 'BookDetail';
      case _i13.BookPage():
        return 'BookPage';
      case _i14.BookSummary():
        return 'BookSummary';
      case _i15.BookTranslation():
        return 'BookTranslation';
      case _i16.ChildBadge():
        return 'ChildBadge';
      case _i17.ChildProfile():
        return 'ChildProfile';
      case _i18.Devotional():
        return 'Devotional';
      case _i19.DevotionalTranslation():
        return 'DevotionalTranslation';
      case _i20.DownloadAsset():
        return 'DownloadAsset';
      case _i21.DownloadBundle():
        return 'DownloadBundle';
      case _i22.DownloadRecord():
        return 'DownloadRecord';
      case _i23.Greeting():
        return 'Greeting';
      case _i24.Page():
        return 'Page';
      case _i25.PageContent():
        return 'PageContent';
      case _i26.ReadingProgress():
        return 'ReadingProgress';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AgeBracket') {
      return deserialize<_i5.AgeBracket>(data['data']);
    }
    if (dataClassName == 'AppLanguage') {
      return deserialize<_i6.AppLanguage>(data['data']);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i7.AppUser>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i8.AuthResponse>(data['data']);
    }
    if (dataClassName == 'Badge') {
      return deserialize<_i9.Badge>(data['data']);
    }
    if (dataClassName == 'Book') {
      return deserialize<_i10.Book>(data['data']);
    }
    if (dataClassName == 'BookCategory') {
      return deserialize<_i11.BookCategory>(data['data']);
    }
    if (dataClassName == 'BookDetail') {
      return deserialize<_i12.BookDetail>(data['data']);
    }
    if (dataClassName == 'BookPage') {
      return deserialize<_i13.BookPage>(data['data']);
    }
    if (dataClassName == 'BookSummary') {
      return deserialize<_i14.BookSummary>(data['data']);
    }
    if (dataClassName == 'BookTranslation') {
      return deserialize<_i15.BookTranslation>(data['data']);
    }
    if (dataClassName == 'ChildBadge') {
      return deserialize<_i16.ChildBadge>(data['data']);
    }
    if (dataClassName == 'ChildProfile') {
      return deserialize<_i17.ChildProfile>(data['data']);
    }
    if (dataClassName == 'Devotional') {
      return deserialize<_i18.Devotional>(data['data']);
    }
    if (dataClassName == 'DevotionalTranslation') {
      return deserialize<_i19.DevotionalTranslation>(data['data']);
    }
    if (dataClassName == 'DownloadAsset') {
      return deserialize<_i20.DownloadAsset>(data['data']);
    }
    if (dataClassName == 'DownloadBundle') {
      return deserialize<_i21.DownloadBundle>(data['data']);
    }
    if (dataClassName == 'DownloadRecord') {
      return deserialize<_i22.DownloadRecord>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i23.Greeting>(data['data']);
    }
    if (dataClassName == 'Page') {
      return deserialize<_i24.Page>(data['data']);
    }
    if (dataClassName == 'PageContent') {
      return deserialize<_i25.PageContent>(data['data']);
    }
    if (dataClassName == 'ReadingProgress') {
      return deserialize<_i26.ReadingProgress>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _i3.Protocol().registerHostProtocol('kingdom_kids', this);
    _i4.Protocol().registerHostProtocol('kingdom_kids', this);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i7.AppUser:
        return _i7.AppUser.t;
      case _i9.Badge:
        return _i9.Badge.t;
      case _i10.Book:
        return _i10.Book.t;
      case _i15.BookTranslation:
        return _i15.BookTranslation.t;
      case _i16.ChildBadge:
        return _i16.ChildBadge.t;
      case _i17.ChildProfile:
        return _i17.ChildProfile.t;
      case _i18.Devotional:
        return _i18.Devotional.t;
      case _i19.DevotionalTranslation:
        return _i19.DevotionalTranslation.t;
      case _i22.DownloadRecord:
        return _i22.DownloadRecord.t;
      case _i24.Page:
        return _i24.Page.t;
      case _i25.PageContent:
        return _i25.PageContent.t;
      case _i26.ReadingProgress:
        return _i26.ReadingProgress.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'kingdom_kids';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
