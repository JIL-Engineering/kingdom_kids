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

abstract class DownloadRecord
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DownloadRecord._({
    this.id,
    required this.child_id,
    required this.book_id,
    required this.device_id,
    required this.downloaded_at,
  });

  factory DownloadRecord({
    int? id,
    required int child_id,
    required int book_id,
    required String device_id,
    required DateTime downloaded_at,
  }) = _DownloadRecordImpl;

  factory DownloadRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return DownloadRecord(
      id: jsonSerialization['id'] as int?,
      child_id: jsonSerialization['child_id'] as int,
      book_id: jsonSerialization['book_id'] as int,
      device_id: jsonSerialization['device_id'] as String,
      downloaded_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['downloaded_at'],
      ),
    );
  }

  static final t = DownloadRecordTable();

  static const db = DownloadRecordRepository._();

  @override
  int? id;

  int child_id;

  int book_id;

  String device_id;

  DateTime downloaded_at;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DownloadRecord copyWith({
    int? id,
    int? child_id,
    int? book_id,
    String? device_id,
    DateTime? downloaded_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DownloadRecord',
      if (id != null) 'id': id,
      'child_id': child_id,
      'book_id': book_id,
      'device_id': device_id,
      'downloaded_at': downloaded_at.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DownloadRecord',
      if (id != null) 'id': id,
      'child_id': child_id,
      'book_id': book_id,
      'device_id': device_id,
      'downloaded_at': downloaded_at.toJson(),
    };
  }

  static DownloadRecordInclude include() {
    return DownloadRecordInclude._();
  }

  static DownloadRecordIncludeList includeList({
    _i1.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    DownloadRecordInclude? include,
  }) {
    return DownloadRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(DownloadRecord.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DownloadRecordImpl extends DownloadRecord {
  _DownloadRecordImpl({
    int? id,
    required int child_id,
    required int book_id,
    required String device_id,
    required DateTime downloaded_at,
  }) : super._(
         id: id,
         child_id: child_id,
         book_id: book_id,
         device_id: device_id,
         downloaded_at: downloaded_at,
       );

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DownloadRecord copyWith({
    Object? id = _Undefined,
    int? child_id,
    int? book_id,
    String? device_id,
    DateTime? downloaded_at,
  }) {
    return DownloadRecord(
      id: id is int? ? id : this.id,
      child_id: child_id ?? this.child_id,
      book_id: book_id ?? this.book_id,
      device_id: device_id ?? this.device_id,
      downloaded_at: downloaded_at ?? this.downloaded_at,
    );
  }
}

class DownloadRecordUpdateTable extends _i1.UpdateTable<DownloadRecordTable> {
  DownloadRecordUpdateTable(super.table);

  _i1.ColumnValue<int, int> child_id(int value) => _i1.ColumnValue(
    table.child_id,
    value,
  );

  _i1.ColumnValue<int, int> book_id(int value) => _i1.ColumnValue(
    table.book_id,
    value,
  );

  _i1.ColumnValue<String, String> device_id(String value) => _i1.ColumnValue(
    table.device_id,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> downloaded_at(DateTime value) =>
      _i1.ColumnValue(
        table.downloaded_at,
        value,
      );
}

class DownloadRecordTable extends _i1.Table<int?> {
  DownloadRecordTable({super.tableRelation})
    : super(tableName: 'download_record') {
    updateTable = DownloadRecordUpdateTable(this);
    child_id = _i1.ColumnInt(
      'child_id',
      this,
    );
    book_id = _i1.ColumnInt(
      'book_id',
      this,
    );
    device_id = _i1.ColumnString(
      'device_id',
      this,
    );
    downloaded_at = _i1.ColumnDateTime(
      'downloaded_at',
      this,
    );
  }

  late final DownloadRecordUpdateTable updateTable;

  late final _i1.ColumnInt child_id;

  late final _i1.ColumnInt book_id;

  late final _i1.ColumnString device_id;

  late final _i1.ColumnDateTime downloaded_at;

  @override
  List<_i1.Column> get columns => [
    id,
    child_id,
    book_id,
    device_id,
    downloaded_at,
  ];
}

class DownloadRecordInclude extends _i1.IncludeObject {
  DownloadRecordInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DownloadRecord.t;
}

class DownloadRecordIncludeList extends _i1.IncludeList {
  DownloadRecordIncludeList._({
    _i1.WhereExpressionBuilder<DownloadRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DownloadRecord.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DownloadRecord.t;
}

class DownloadRecordRepository {
  const DownloadRecordRepository._();

  /// Returns a list of [DownloadRecord]s matching the given query parameters.
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
  Future<List<DownloadRecord>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DownloadRecord>(
      where: where?.call(DownloadRecord.t),
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [DownloadRecord] matching the given query parameters.
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
  Future<DownloadRecord?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? offset,
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DownloadRecord>(
      where: where?.call(DownloadRecord.t),
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DownloadRecord] by its [id] or null if no such row exists.
  Future<DownloadRecord?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<DownloadRecord>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [DownloadRecord]s in the list and returns the inserted rows.
  ///
  /// The returned [DownloadRecord]s will have their `id` fields set.
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
  Future<List<DownloadRecord>> insert(
    _i1.DatabaseSession session,
    List<DownloadRecord> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<DownloadRecord>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [DownloadRecord] and returns the inserted row.
  ///
  /// The returned [DownloadRecord] will have its `id` field set.
  Future<DownloadRecord> insertRow(
    _i1.DatabaseSession session,
    DownloadRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DownloadRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [DownloadRecord]s in the list and returns the resulting rows.
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
  /// The returned [DownloadRecord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DownloadRecord>> upsert(
    _i1.DatabaseSession session,
    List<DownloadRecord> rows, {
    required _i1.ColumnSelections<DownloadRecordTable> conflictColumns,
    _i1.ColumnSelections<DownloadRecordTable>? updateColumns,
    _i1.WhereExpressionBuilder<DownloadRecordTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<DownloadRecord>(
      rows,
      conflictColumns: conflictColumns(DownloadRecord.t),
      updateColumns: updateColumns?.call(DownloadRecord.t),
      updateWhere: updateWhere?.call(DownloadRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [DownloadRecord] and returns the resulting row.
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
  /// The returned [DownloadRecord] will have its `id` field set.
  Future<DownloadRecord?> upsertRow(
    _i1.DatabaseSession session,
    DownloadRecord row, {
    required _i1.ColumnSelections<DownloadRecordTable> conflictColumns,
    _i1.ColumnSelections<DownloadRecordTable>? updateColumns,
    _i1.WhereExpressionBuilder<DownloadRecordTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<DownloadRecord>(
      row,
      conflictColumns: conflictColumns(DownloadRecord.t),
      updateColumns: updateColumns?.call(DownloadRecord.t),
      updateWhere: updateWhere?.call(DownloadRecord.t),
      transaction: transaction,
    );
  }

  /// Updates all [DownloadRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DownloadRecord>> update(
    _i1.DatabaseSession session,
    List<DownloadRecord> rows, {
    _i1.ColumnSelections<DownloadRecordTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<DownloadRecord>(
      rows,
      columns: columns?.call(DownloadRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [DownloadRecord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DownloadRecord> updateRow(
    _i1.DatabaseSession session,
    DownloadRecord row, {
    _i1.ColumnSelections<DownloadRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DownloadRecord>(
      row,
      columns: columns?.call(DownloadRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DownloadRecord] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DownloadRecord?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<DownloadRecordUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DownloadRecord>(
      id,
      columnValues: columnValues(DownloadRecord.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DownloadRecord]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DownloadRecord>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DownloadRecordUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DownloadRecordTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<DownloadRecord>(
      columnValues: columnValues(DownloadRecord.t.updateTable),
      where: where(DownloadRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [DownloadRecord]s in the list and returns the deleted rows.
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
  Future<List<DownloadRecord>> delete(
    _i1.DatabaseSession session,
    List<DownloadRecord> rows, {
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<DownloadRecord>(
      rows,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [DownloadRecord].
  Future<DownloadRecord> deleteRow(
    _i1.DatabaseSession session,
    DownloadRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DownloadRecord>(
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
  Future<List<DownloadRecord>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DownloadRecordTable> where,
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<DownloadRecord>(
      where: where(DownloadRecord.t),
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
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
    _i1.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DownloadRecord>(
      where: where?.call(DownloadRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DownloadRecord] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DownloadRecordTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DownloadRecord>(
      where: where(DownloadRecord.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
