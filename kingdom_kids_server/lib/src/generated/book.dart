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

abstract class Book implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Book._({
    this.id,
    required this.slug,
    required this.ageBracketMin,
    required this.ageBracketMax,
    required this.category,
    this.coverImageAsset,
    required this.isPublished,
    required this.contentVersion,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Book({
    int? id,
    required String slug,
    required String ageBracketMin,
    required String ageBracketMax,
    required String category,
    String? coverImageAsset,
    required bool isPublished,
    required int contentVersion,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) = _BookImpl;

  factory Book.fromJson(Map<String, dynamic> jsonSerialization) {
    return Book(
      id: jsonSerialization['id'] as int?,
      slug: jsonSerialization['slug'] as String,
      ageBracketMin: jsonSerialization['ageBracketMin'] as String,
      ageBracketMax: jsonSerialization['ageBracketMax'] as String,
      category: jsonSerialization['category'] as String,
      coverImageAsset: jsonSerialization['coverImageAsset'] as String?,
      isPublished: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isPublished'],
      ),
      contentVersion: jsonSerialization['contentVersion'] as int,
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = BookTable();

  static const db = BookRepository._();

  @override
  int? id;

  String slug;

  String ageBracketMin;

  String ageBracketMax;

  String category;

  String? coverImageAsset;

  bool isPublished;

  int contentVersion;

  DateTime updatedAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Book]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Book copyWith({
    int? id,
    String? slug,
    String? ageBracketMin,
    String? ageBracketMax,
    String? category,
    String? coverImageAsset,
    bool? isPublished,
    int? contentVersion,
    DateTime? updatedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Book',
      if (id != null) 'id': id,
      'slug': slug,
      'ageBracketMin': ageBracketMin,
      'ageBracketMax': ageBracketMax,
      'category': category,
      if (coverImageAsset != null) 'coverImageAsset': coverImageAsset,
      'isPublished': isPublished,
      'contentVersion': contentVersion,
      'updatedAt': updatedAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Book',
      if (id != null) 'id': id,
      'slug': slug,
      'ageBracketMin': ageBracketMin,
      'ageBracketMax': ageBracketMax,
      'category': category,
      if (coverImageAsset != null) 'coverImageAsset': coverImageAsset,
      'isPublished': isPublished,
      'contentVersion': contentVersion,
      'updatedAt': updatedAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static BookInclude include() {
    return BookInclude._();
  }

  static BookIncludeList includeList({
    _i1.WhereExpressionBuilder<BookTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BookTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookTable>? orderByList,
    BookInclude? include,
  }) {
    return BookIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Book.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(Book.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookImpl extends Book {
  _BookImpl({
    int? id,
    required String slug,
    required String ageBracketMin,
    required String ageBracketMax,
    required String category,
    String? coverImageAsset,
    required bool isPublished,
    required int contentVersion,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         slug: slug,
         ageBracketMin: ageBracketMin,
         ageBracketMax: ageBracketMax,
         category: category,
         coverImageAsset: coverImageAsset,
         isPublished: isPublished,
         contentVersion: contentVersion,
         updatedAt: updatedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Book]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Book copyWith({
    Object? id = _Undefined,
    String? slug,
    String? ageBracketMin,
    String? ageBracketMax,
    String? category,
    Object? coverImageAsset = _Undefined,
    bool? isPublished,
    int? contentVersion,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Book(
      id: id is int? ? id : this.id,
      slug: slug ?? this.slug,
      ageBracketMin: ageBracketMin ?? this.ageBracketMin,
      ageBracketMax: ageBracketMax ?? this.ageBracketMax,
      category: category ?? this.category,
      coverImageAsset: coverImageAsset is String?
          ? coverImageAsset
          : this.coverImageAsset,
      isPublished: isPublished ?? this.isPublished,
      contentVersion: contentVersion ?? this.contentVersion,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BookUpdateTable extends _i1.UpdateTable<BookTable> {
  BookUpdateTable(super.table);

  _i1.ColumnValue<String, String> slug(String value) => _i1.ColumnValue(
    table.slug,
    value,
  );

  _i1.ColumnValue<String, String> ageBracketMin(String value) =>
      _i1.ColumnValue(
        table.ageBracketMin,
        value,
      );

  _i1.ColumnValue<String, String> ageBracketMax(String value) =>
      _i1.ColumnValue(
        table.ageBracketMax,
        value,
      );

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<String, String> coverImageAsset(String? value) =>
      _i1.ColumnValue(
        table.coverImageAsset,
        value,
      );

  _i1.ColumnValue<bool, bool> isPublished(bool value) => _i1.ColumnValue(
    table.isPublished,
    value,
  );

  _i1.ColumnValue<int, int> contentVersion(int value) => _i1.ColumnValue(
    table.contentVersion,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class BookTable extends _i1.Table<int?> {
  BookTable({super.tableRelation}) : super(tableName: 'books') {
    updateTable = BookUpdateTable(this);
    slug = _i1.ColumnString(
      'slug',
      this,
    );
    ageBracketMin = _i1.ColumnString(
      'ageBracketMin',
      this,
    );
    ageBracketMax = _i1.ColumnString(
      'ageBracketMax',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    coverImageAsset = _i1.ColumnString(
      'coverImageAsset',
      this,
    );
    isPublished = _i1.ColumnBool(
      'isPublished',
      this,
    );
    contentVersion = _i1.ColumnInt(
      'contentVersion',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final BookUpdateTable updateTable;

  late final _i1.ColumnString slug;

  late final _i1.ColumnString ageBracketMin;

  late final _i1.ColumnString ageBracketMax;

  late final _i1.ColumnString category;

  late final _i1.ColumnString coverImageAsset;

  late final _i1.ColumnBool isPublished;

  late final _i1.ColumnInt contentVersion;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    slug,
    ageBracketMin,
    ageBracketMax,
    category,
    coverImageAsset,
    isPublished,
    contentVersion,
    updatedAt,
    createdAt,
  ];
}

class BookInclude extends _i1.IncludeObject {
  BookInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Book.t;
}

class BookIncludeList extends _i1.IncludeList {
  BookIncludeList._({
    _i1.WhereExpressionBuilder<BookTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Book.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Book.t;
}

class BookRepository {
  const BookRepository._();

  /// Returns a list of [Book]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Book>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BookTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BookTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Book>(
      where: where?.call(Book.t),
      orderBy: orderBy?.call(Book.t),
      orderByList: orderByList?.call(Book.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Book] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Book?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BookTable>? where,
    int? offset,
    _i1.OrderByBuilder<BookTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Book>(
      where: where?.call(Book.t),
      orderBy: orderBy?.call(Book.t),
      orderByList: orderByList?.call(Book.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Book] by its [id] or null if no such row exists.
  Future<Book?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Book>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Book]s in the list and returns the inserted rows.
  ///
  /// The returned [Book]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Book>> insert(
    _i1.DatabaseSession session,
    List<Book> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Book>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Book] and returns the inserted row.
  ///
  /// The returned [Book] will have its `id` field set.
  Future<Book> insertRow(
    _i1.DatabaseSession session,
    Book row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Book>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Book]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [Book]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Book>> upsert(
    _i1.DatabaseSession session,
    List<Book> rows, {
    required _i1.ColumnSelections<BookTable> conflictColumns,
    _i1.ColumnSelections<BookTable>? updateColumns,
    _i1.WhereExpressionBuilder<BookTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Book>(
      rows,
      conflictColumns: conflictColumns(Book.t),
      updateColumns: updateColumns?.call(Book.t),
      updateWhere: updateWhere?.call(Book.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Book] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [Book] will have its `id` field set.
  Future<Book?> upsertRow(
    _i1.DatabaseSession session,
    Book row, {
    required _i1.ColumnSelections<BookTable> conflictColumns,
    _i1.ColumnSelections<BookTable>? updateColumns,
    _i1.WhereExpressionBuilder<BookTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Book>(
      row,
      conflictColumns: conflictColumns(Book.t),
      updateColumns: updateColumns?.call(Book.t),
      updateWhere: updateWhere?.call(Book.t),
      transaction: transaction,
    );
  }

  /// Updates all [Book]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Book>> update(
    _i1.DatabaseSession session,
    List<Book> rows, {
    _i1.ColumnSelections<BookTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Book>(
      rows,
      columns: columns?.call(Book.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Book]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Book> updateRow(
    _i1.DatabaseSession session,
    Book row, {
    _i1.ColumnSelections<BookTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Book>(
      row,
      columns: columns?.call(Book.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Book] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Book?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<BookUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Book>(
      id,
      columnValues: columnValues(Book.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Book]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Book>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<BookUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<BookTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BookTable>? orderBy,
    _i1.OrderByListBuilder<BookTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Book>(
      columnValues: columnValues(Book.t.updateTable),
      where: where(Book.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Book.t),
      orderByList: orderByList?.call(Book.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Book]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Book>> delete(
    _i1.DatabaseSession session,
    List<Book> rows, {
    _i1.OrderByBuilder<BookTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Book>(
      rows,
      orderBy: orderBy?.call(Book.t),
      orderByList: orderByList?.call(Book.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Book].
  Future<Book> deleteRow(
    _i1.DatabaseSession session,
    Book row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Book>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Book>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<BookTable> where,
    _i1.OrderByBuilder<BookTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Book>(
      where: where(Book.t),
      orderBy: orderBy?.call(Book.t),
      orderByList: orderByList?.call(Book.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BookTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Book>(
      where: where?.call(Book.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Book] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<BookTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Book>(
      where: where(Book.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
