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

abstract class Page implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Page._({
    this.id,
    required this.book_id,
    required this.page_number,
    required this.illustration_asset,
    required this.layout_type,
  });

  factory Page({
    int? id,
    required int book_id,
    required int page_number,
    required String illustration_asset,
    required String layout_type,
  }) = _PageImpl;

  factory Page.fromJson(Map<String, dynamic> jsonSerialization) {
    return Page(
      id: jsonSerialization['id'] as int?,
      book_id: jsonSerialization['book_id'] as int,
      page_number: jsonSerialization['page_number'] as int,
      illustration_asset: jsonSerialization['illustration_asset'] as String,
      layout_type: jsonSerialization['layout_type'] as String,
    );
  }

  static final t = PageTable();

  static const db = PageRepository._();

  @override
  int? id;

  int book_id;

  int page_number;

  String illustration_asset;

  String layout_type;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Page]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Page copyWith({
    int? id,
    int? book_id,
    int? page_number,
    String? illustration_asset,
    String? layout_type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Page',
      if (id != null) 'id': id,
      'book_id': book_id,
      'page_number': page_number,
      'illustration_asset': illustration_asset,
      'layout_type': layout_type,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Page',
      if (id != null) 'id': id,
      'book_id': book_id,
      'page_number': page_number,
      'illustration_asset': illustration_asset,
      'layout_type': layout_type,
    };
  }

  static PageInclude include() {
    return PageInclude._();
  }

  static PageIncludeList includeList({
    _i1.WhereExpressionBuilder<PageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PageTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageTable>? orderByList,
    PageInclude? include,
  }) {
    return PageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Page.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(Page.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PageImpl extends Page {
  _PageImpl({
    int? id,
    required int book_id,
    required int page_number,
    required String illustration_asset,
    required String layout_type,
  }) : super._(
         id: id,
         book_id: book_id,
         page_number: page_number,
         illustration_asset: illustration_asset,
         layout_type: layout_type,
       );

  /// Returns a shallow copy of this [Page]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Page copyWith({
    Object? id = _Undefined,
    int? book_id,
    int? page_number,
    String? illustration_asset,
    String? layout_type,
  }) {
    return Page(
      id: id is int? ? id : this.id,
      book_id: book_id ?? this.book_id,
      page_number: page_number ?? this.page_number,
      illustration_asset: illustration_asset ?? this.illustration_asset,
      layout_type: layout_type ?? this.layout_type,
    );
  }
}

class PageUpdateTable extends _i1.UpdateTable<PageTable> {
  PageUpdateTable(super.table);

  _i1.ColumnValue<int, int> book_id(int value) => _i1.ColumnValue(
    table.book_id,
    value,
  );

  _i1.ColumnValue<int, int> page_number(int value) => _i1.ColumnValue(
    table.page_number,
    value,
  );

  _i1.ColumnValue<String, String> illustration_asset(String value) =>
      _i1.ColumnValue(
        table.illustration_asset,
        value,
      );

  _i1.ColumnValue<String, String> layout_type(String value) => _i1.ColumnValue(
    table.layout_type,
    value,
  );
}

class PageTable extends _i1.Table<int?> {
  PageTable({super.tableRelation}) : super(tableName: 'page') {
    updateTable = PageUpdateTable(this);
    book_id = _i1.ColumnInt(
      'book_id',
      this,
    );
    page_number = _i1.ColumnInt(
      'page_number',
      this,
    );
    illustration_asset = _i1.ColumnString(
      'illustration_asset',
      this,
    );
    layout_type = _i1.ColumnString(
      'layout_type',
      this,
    );
  }

  late final PageUpdateTable updateTable;

  late final _i1.ColumnInt book_id;

  late final _i1.ColumnInt page_number;

  late final _i1.ColumnString illustration_asset;

  late final _i1.ColumnString layout_type;

  @override
  List<_i1.Column> get columns => [
    id,
    book_id,
    page_number,
    illustration_asset,
    layout_type,
  ];
}

class PageInclude extends _i1.IncludeObject {
  PageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Page.t;
}

class PageIncludeList extends _i1.IncludeList {
  PageIncludeList._({
    _i1.WhereExpressionBuilder<PageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Page.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Page.t;
}

class PageRepository {
  const PageRepository._();

  /// Returns a list of [Page]s matching the given query parameters.
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
  Future<List<Page>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PageTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Page>(
      where: where?.call(Page.t),
      orderBy: orderBy?.call(Page.t),
      orderByList: orderByList?.call(Page.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Page] matching the given query parameters.
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
  Future<Page?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PageTable>? where,
    int? offset,
    _i1.OrderByBuilder<PageTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Page>(
      where: where?.call(Page.t),
      orderBy: orderBy?.call(Page.t),
      orderByList: orderByList?.call(Page.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Page] by its [id] or null if no such row exists.
  Future<Page?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Page>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Page]s in the list and returns the inserted rows.
  ///
  /// The returned [Page]s will have their `id` fields set.
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
  Future<List<Page>> insert(
    _i1.DatabaseSession session,
    List<Page> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Page>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Page] and returns the inserted row.
  ///
  /// The returned [Page] will have its `id` field set.
  Future<Page> insertRow(
    _i1.DatabaseSession session,
    Page row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Page>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Page]s in the list and returns the resulting rows.
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
  /// The returned [Page]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Page>> upsert(
    _i1.DatabaseSession session,
    List<Page> rows, {
    required _i1.ColumnSelections<PageTable> conflictColumns,
    _i1.ColumnSelections<PageTable>? updateColumns,
    _i1.WhereExpressionBuilder<PageTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Page>(
      rows,
      conflictColumns: conflictColumns(Page.t),
      updateColumns: updateColumns?.call(Page.t),
      updateWhere: updateWhere?.call(Page.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Page] and returns the resulting row.
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
  /// The returned [Page] will have its `id` field set.
  Future<Page?> upsertRow(
    _i1.DatabaseSession session,
    Page row, {
    required _i1.ColumnSelections<PageTable> conflictColumns,
    _i1.ColumnSelections<PageTable>? updateColumns,
    _i1.WhereExpressionBuilder<PageTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Page>(
      row,
      conflictColumns: conflictColumns(Page.t),
      updateColumns: updateColumns?.call(Page.t),
      updateWhere: updateWhere?.call(Page.t),
      transaction: transaction,
    );
  }

  /// Updates all [Page]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Page>> update(
    _i1.DatabaseSession session,
    List<Page> rows, {
    _i1.ColumnSelections<PageTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Page>(
      rows,
      columns: columns?.call(Page.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Page]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Page> updateRow(
    _i1.DatabaseSession session,
    Page row, {
    _i1.ColumnSelections<PageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Page>(
      row,
      columns: columns?.call(Page.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Page] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Page?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<PageUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Page>(
      id,
      columnValues: columnValues(Page.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Page]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Page>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PageUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PageTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PageTable>? orderBy,
    _i1.OrderByListBuilder<PageTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Page>(
      columnValues: columnValues(Page.t.updateTable),
      where: where(Page.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Page.t),
      orderByList: orderByList?.call(Page.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Page]s in the list and returns the deleted rows.
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
  Future<List<Page>> delete(
    _i1.DatabaseSession session,
    List<Page> rows, {
    _i1.OrderByBuilder<PageTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Page>(
      rows,
      orderBy: orderBy?.call(Page.t),
      orderByList: orderByList?.call(Page.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Page].
  Future<Page> deleteRow(
    _i1.DatabaseSession session,
    Page row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Page>(
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
  Future<List<Page>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PageTable> where,
    _i1.OrderByBuilder<PageTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<PageTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Page>(
      where: where(Page.t),
      orderBy: orderBy?.call(Page.t),
      orderByList: orderByList?.call(Page.t),
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
    _i1.WhereExpressionBuilder<PageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Page>(
      where: where?.call(Page.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Page] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PageTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Page>(
      where: where(Page.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
