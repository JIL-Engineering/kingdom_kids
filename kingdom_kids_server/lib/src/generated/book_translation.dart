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
import 'package:serverpod/serverpod.dart' as _is;

abstract class BookTranslation
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  BookTranslation._({
    this.id,
    required this.bookId,
    required this.language,
    required this.title,
  });

  factory BookTranslation({
    int? id,
    required int bookId,
    required String language,
    required String title,
  }) = _BookTranslationImpl;

  factory BookTranslation.fromJson(Map<String, dynamic> jsonSerialization) {
    return BookTranslation(
      id: jsonSerialization['id'] as int?,
      bookId: jsonSerialization['bookId'] as int,
      language: jsonSerialization['language'] as String,
      title: jsonSerialization['title'] as String,
    );
  }

  static final t = BookTranslationTable();

  static const db = BookTranslationRepository._();

  @override
  int? id;

  int bookId;

  String language;

  String title;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [BookTranslation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  BookTranslation copyWith({
    int? id,
    int? bookId,
    String? language,
    String? title,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BookTranslation',
      if (id != null) 'id': id,
      'bookId': bookId,
      'language': language,
      'title': title,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BookTranslation',
      if (id != null) 'id': id,
      'bookId': bookId,
      'language': language,
      'title': title,
    };
  }

  static BookTranslationInclude include() {
    return BookTranslationInclude._();
  }

  static BookTranslationIncludeList includeList({
    _is.WhereExpressionBuilder<BookTranslationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookTranslationTable>? orderBy,
    _is.OrderByListBuilder<BookTranslationTable>? orderByList,
    BookTranslationInclude? include,
  }) {
    return BookTranslationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BookTranslation.t),
      orderByList: orderByList?.call(BookTranslation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookTranslationImpl extends BookTranslation {
  _BookTranslationImpl({
    int? id,
    required int bookId,
    required String language,
    required String title,
  }) : super._(
         id: id,
         bookId: bookId,
         language: language,
         title: title,
       );

  /// Returns a shallow copy of this [BookTranslation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  BookTranslation copyWith({
    Object? id = _Undefined,
    int? bookId,
    String? language,
    String? title,
  }) {
    return BookTranslation(
      id: id is int? ? id : this.id,
      bookId: bookId ?? this.bookId,
      language: language ?? this.language,
      title: title ?? this.title,
    );
  }
}

class BookTranslationUpdateTable extends _is.UpdateTable<BookTranslationTable> {
  BookTranslationUpdateTable(super.table);

  _is.ColumnValue<int, int> bookId(int value) => _is.ColumnValue(
    table.bookId,
    value,
  );

  _is.ColumnValue<String, String> language(String value) => _is.ColumnValue(
    table.language,
    value,
  );

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );
}

class BookTranslationTable extends _is.Table<int?> {
  BookTranslationTable({super.tableRelation})
    : super(tableName: 'book_translation') {
    updateTable = BookTranslationUpdateTable(this);
    bookId = _is.ColumnInt(
      'bookId',
      this,
    );
    language = _is.ColumnString(
      'language',
      this,
    );
    title = _is.ColumnString(
      'title',
      this,
    );
  }

  late final BookTranslationUpdateTable updateTable;

  late final _is.ColumnInt bookId;

  late final _is.ColumnString language;

  late final _is.ColumnString title;

  @override
  List<_is.Column> get columns => [
    id,
    bookId,
    language,
    title,
  ];
}

class BookTranslationInclude extends _is.IncludeObject {
  BookTranslationInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => BookTranslation.t;
}

class BookTranslationIncludeList extends _is.IncludeList {
  BookTranslationIncludeList._({
    _is.WhereExpressionBuilder<BookTranslationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BookTranslation.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => BookTranslation.t;
}

class BookTranslationRepository {
  const BookTranslationRepository._();

  /// Returns a list of [BookTranslation]s matching the given query parameters.
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
  Future<List<BookTranslation>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookTranslationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookTranslationTable>? orderBy,
    _is.OrderByListBuilder<BookTranslationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<BookTranslation>(
      where: where?.call(BookTranslation.t),
      orderBy: orderBy?.call(BookTranslation.t),
      orderByList: orderByList?.call(BookTranslation.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [BookTranslation] matching the given query parameters.
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
  Future<BookTranslation?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookTranslationTable>? where,
    int? offset,
    _is.OrderByBuilder<BookTranslationTable>? orderBy,
    _is.OrderByListBuilder<BookTranslationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<BookTranslation>(
      where: where?.call(BookTranslation.t),
      orderBy: orderBy?.call(BookTranslation.t),
      orderByList: orderByList?.call(BookTranslation.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [BookTranslation] by its [id] or null if no such row exists.
  Future<BookTranslation?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<BookTranslation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [BookTranslation]s in the list and returns the inserted rows.
  ///
  /// The returned [BookTranslation]s will have their `id` fields set.
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
  Future<List<BookTranslation>> insert(
    _is.DatabaseSession session,
    List<BookTranslation> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<BookTranslation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [BookTranslation] and returns the inserted row.
  ///
  /// The returned [BookTranslation] will have its `id` field set.
  Future<BookTranslation> insertRow(
    _is.DatabaseSession session,
    BookTranslation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<BookTranslation>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [BookTranslation]s in the list and returns the resulting rows.
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
  /// The returned [BookTranslation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BookTranslation>> upsert(
    _is.DatabaseSession session,
    List<BookTranslation> rows, {
    required _is.ColumnSelections<BookTranslationTable> conflictColumns,
    _is.ColumnSelections<BookTranslationTable>? updateColumns,
    _is.WhereExpressionBuilder<BookTranslationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<BookTranslation>(
      rows,
      conflictColumns: conflictColumns(BookTranslation.t),
      updateColumns: updateColumns?.call(BookTranslation.t),
      updateWhere: updateWhere?.call(BookTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [BookTranslation] and returns the resulting row.
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
  /// The returned [BookTranslation] will have its `id` field set.
  Future<BookTranslation?> upsertRow(
    _is.DatabaseSession session,
    BookTranslation row, {
    required _is.ColumnSelections<BookTranslationTable> conflictColumns,
    _is.ColumnSelections<BookTranslationTable>? updateColumns,
    _is.WhereExpressionBuilder<BookTranslationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<BookTranslation>(
      row,
      conflictColumns: conflictColumns(BookTranslation.t),
      updateColumns: updateColumns?.call(BookTranslation.t),
      updateWhere: updateWhere?.call(BookTranslation.t),
      transaction: transaction,
    );
  }

  /// Updates all [BookTranslation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BookTranslation>> update(
    _is.DatabaseSession session,
    List<BookTranslation> rows, {
    _is.ColumnSelections<BookTranslationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<BookTranslation>(
      rows,
      columns: columns?.call(BookTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [BookTranslation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BookTranslation> updateRow(
    _is.DatabaseSession session,
    BookTranslation row, {
    _is.ColumnSelections<BookTranslationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<BookTranslation>(
      row,
      columns: columns?.call(BookTranslation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BookTranslation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<BookTranslation?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<BookTranslationUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<BookTranslation>(
      id,
      columnValues: columnValues(BookTranslation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [BookTranslation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<BookTranslation>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<BookTranslationUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<BookTranslationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<BookTranslationTable>? orderBy,
    _is.OrderByListBuilder<BookTranslationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<BookTranslation>(
      columnValues: columnValues(BookTranslation.t.updateTable),
      where: where(BookTranslation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BookTranslation.t),
      orderByList: orderByList?.call(BookTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [BookTranslation]s in the list and returns the deleted rows.
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
  Future<List<BookTranslation>> delete(
    _is.DatabaseSession session,
    List<BookTranslation> rows, {
    _is.OrderByBuilder<BookTranslationTable>? orderBy,
    _is.OrderByListBuilder<BookTranslationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<BookTranslation>(
      rows,
      orderBy: orderBy?.call(BookTranslation.t),
      orderByList: orderByList?.call(BookTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [BookTranslation].
  Future<BookTranslation> deleteRow(
    _is.DatabaseSession session,
    BookTranslation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BookTranslation>(
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
  Future<List<BookTranslation>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BookTranslationTable> where,
    _is.OrderByBuilder<BookTranslationTable>? orderBy,
    _is.OrderByListBuilder<BookTranslationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<BookTranslation>(
      where: where(BookTranslation.t),
      orderBy: orderBy?.call(BookTranslation.t),
      orderByList: orderByList?.call(BookTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<BookTranslationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<BookTranslation>(
      where: where?.call(BookTranslation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [BookTranslation] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<BookTranslationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<BookTranslation>(
      where: where(BookTranslation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
