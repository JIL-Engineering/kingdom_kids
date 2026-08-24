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

abstract class DownloadRecord
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  DownloadRecord._({
    this.id,
    required this.childId,
    required this.bookId,
    required this.deviceId,
    required this.downloadedAt,
  });

  factory DownloadRecord({
    int? id,
    required int childId,
    required int bookId,
    required String deviceId,
    required DateTime downloadedAt,
  }) = _DownloadRecordImpl;

  factory DownloadRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return DownloadRecord(
      id: jsonSerialization['id'] as int?,
      childId: jsonSerialization['childId'] as int,
      bookId: jsonSerialization['bookId'] as int,
      deviceId: jsonSerialization['deviceId'] as String,
      downloadedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['downloadedAt'],
      ),
    );
  }

  static final t = DownloadRecordTable();

  static const db = DownloadRecordRepository._();

  @override
  int? id;

  int childId;

  int bookId;

  String deviceId;

  DateTime downloadedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  DownloadRecord copyWith({
    int? id,
    int? childId,
    int? bookId,
    String? deviceId,
    DateTime? downloadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DownloadRecord',
      if (id != null) 'id': id,
      'childId': childId,
      'bookId': bookId,
      'deviceId': deviceId,
      'downloadedAt': downloadedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DownloadRecord',
      if (id != null) 'id': id,
      'childId': childId,
      'bookId': bookId,
      'deviceId': deviceId,
      'downloadedAt': downloadedAt.toJson(),
    };
  }

  static DownloadRecordInclude include() {
    return DownloadRecordInclude._();
  }

  static DownloadRecordIncludeList includeList({
    _is.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DownloadRecordTable>? orderBy,
    _is.OrderByListBuilder<DownloadRecordTable>? orderByList,
    DownloadRecordInclude? include,
  }) {
    return DownloadRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DownloadRecordImpl extends DownloadRecord {
  _DownloadRecordImpl({
    int? id,
    required int childId,
    required int bookId,
    required String deviceId,
    required DateTime downloadedAt,
  }) : super._(
         id: id,
         childId: childId,
         bookId: bookId,
         deviceId: deviceId,
         downloadedAt: downloadedAt,
       );

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  DownloadRecord copyWith({
    Object? id = _Undefined,
    int? childId,
    int? bookId,
    String? deviceId,
    DateTime? downloadedAt,
  }) {
    return DownloadRecord(
      id: id is int? ? id : this.id,
      childId: childId ?? this.childId,
      bookId: bookId ?? this.bookId,
      deviceId: deviceId ?? this.deviceId,
      downloadedAt: downloadedAt ?? this.downloadedAt,
    );
  }
}

class DownloadRecordUpdateTable extends _is.UpdateTable<DownloadRecordTable> {
  DownloadRecordUpdateTable(super.table);

  _is.ColumnValue<int, int> childId(int value) => _is.ColumnValue(
    table.childId,
    value,
  );

  _is.ColumnValue<int, int> bookId(int value) => _is.ColumnValue(
    table.bookId,
    value,
  );

  _is.ColumnValue<String, String> deviceId(String value) => _is.ColumnValue(
    table.deviceId,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> downloadedAt(DateTime value) =>
      _is.ColumnValue(
        table.downloadedAt,
        value,
      );
}

class DownloadRecordTable extends _is.Table<int?> {
  DownloadRecordTable({super.tableRelation})
    : super(tableName: 'download_record') {
    updateTable = DownloadRecordUpdateTable(this);
    childId = _is.ColumnInt(
      'childId',
      this,
    );
    bookId = _is.ColumnInt(
      'bookId',
      this,
    );
    deviceId = _is.ColumnString(
      'deviceId',
      this,
    );
    downloadedAt = _is.ColumnDateTime(
      'downloadedAt',
      this,
    );
  }

  late final DownloadRecordUpdateTable updateTable;

  late final _is.ColumnInt childId;

  late final _is.ColumnInt bookId;

  late final _is.ColumnString deviceId;

  late final _is.ColumnDateTime downloadedAt;

  @override
  List<_is.Column> get columns => [
    id,
    childId,
    bookId,
    deviceId,
    downloadedAt,
  ];
}

class DownloadRecordInclude extends _is.IncludeObject {
  DownloadRecordInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => DownloadRecord.t;
}

class DownloadRecordIncludeList extends _is.IncludeList {
  DownloadRecordIncludeList._({
    _is.WhereExpressionBuilder<DownloadRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DownloadRecord.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => DownloadRecord.t;
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DownloadRecordTable>? orderBy,
    _is.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DownloadRecord>(
      where: where?.call(DownloadRecord.t),
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? offset,
    _is.OrderByBuilder<DownloadRecordTable>? orderBy,
    _is.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DownloadRecord>(
      where: where?.call(DownloadRecord.t),
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DownloadRecord] by its [id] or null if no such row exists.
  Future<DownloadRecord?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
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
    _is.DatabaseSession session,
    List<DownloadRecord> rows, {
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    DownloadRecord row, {
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    List<DownloadRecord> rows, {
    required _is.ColumnSelections<DownloadRecordTable> conflictColumns,
    _is.ColumnSelections<DownloadRecordTable>? updateColumns,
    _is.WhereExpressionBuilder<DownloadRecordTable>? updateWhere,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    DownloadRecord row, {
    required _is.ColumnSelections<DownloadRecordTable> conflictColumns,
    _is.ColumnSelections<DownloadRecordTable>? updateColumns,
    _is.WhereExpressionBuilder<DownloadRecordTable>? updateWhere,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    List<DownloadRecord> rows, {
    _is.ColumnSelections<DownloadRecordTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    DownloadRecord row, {
    _is.ColumnSelections<DownloadRecordTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<DownloadRecordUpdateTable> columnValues,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<DownloadRecordUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<DownloadRecordTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DownloadRecordTable>? orderBy,
    _is.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<DownloadRecord>(
      columnValues: columnValues(DownloadRecord.t.updateTable),
      where: where(DownloadRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
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
    _is.DatabaseSession session,
    List<DownloadRecord> rows, {
    _is.OrderByBuilder<DownloadRecordTable>? orderBy,
    _is.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<DownloadRecord>(
      rows,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [DownloadRecord].
  Future<DownloadRecord> deleteRow(
    _is.DatabaseSession session,
    DownloadRecord row, {
    _is.Transaction? transaction,
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
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DownloadRecordTable> where,
    _is.OrderByBuilder<DownloadRecordTable>? orderBy,
    _is.OrderByListBuilder<DownloadRecordTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<DownloadRecord>(
      where: where(DownloadRecord.t),
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<DownloadRecord>(
      where: where?.call(DownloadRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DownloadRecord] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DownloadRecordTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DownloadRecord>(
      where: where(DownloadRecord.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
