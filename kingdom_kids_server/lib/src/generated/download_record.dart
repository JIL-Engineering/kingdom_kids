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
      downloadedAt: _i1.DateTimeJsonExtension.fromJson(
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
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    _i1.WhereExpressionBuilder<DownloadRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    DownloadRecordInclude? include,
  }) {
    return DownloadRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderDescending: orderDescending,
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
  @_i1.useResult
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

class DownloadRecordUpdateTable extends _i1.UpdateTable<DownloadRecordTable> {
  DownloadRecordUpdateTable(super.table);

  _i1.ColumnValue<int, int> childId(int value) => _i1.ColumnValue(
    table.childId,
    value,
  );

  _i1.ColumnValue<int, int> bookId(int value) => _i1.ColumnValue(
    table.bookId,
    value,
  );

  _i1.ColumnValue<String, String> deviceId(String value) => _i1.ColumnValue(
    table.deviceId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> downloadedAt(DateTime value) =>
      _i1.ColumnValue(
        table.downloadedAt,
        value,
      );
}

class DownloadRecordTable extends _i1.Table<int?> {
  DownloadRecordTable({super.tableRelation})
    : super(tableName: 'download_records') {
    updateTable = DownloadRecordUpdateTable(this);
    childId = _i1.ColumnInt(
      'childId',
      this,
    );
    bookId = _i1.ColumnInt(
      'bookId',
      this,
    );
    deviceId = _i1.ColumnString(
      'deviceId',
      this,
    );
    downloadedAt = _i1.ColumnDateTime(
      'downloadedAt',
      this,
    );
  }

  late final DownloadRecordUpdateTable updateTable;

  late final _i1.ColumnInt childId;

  late final _i1.ColumnInt bookId;

  late final _i1.ColumnString deviceId;

  late final _i1.ColumnDateTime downloadedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    childId,
    bookId,
    deviceId,
    downloadedAt,
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
      orderDescending: orderDescending,
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
      orderDescending: orderDescending,
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
  Future<List<DownloadRecord>> insert(
    _i1.DatabaseSession session,
    List<DownloadRecord> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<DownloadRecord>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
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

  /// Updates all [DownloadRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DownloadRecord>> update(
    _i1.DatabaseSession session,
    List<DownloadRecord> rows, {
    _i1.ColumnSelections<DownloadRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DownloadRecord>(
      rows,
      columns: columns?.call(DownloadRecord.t),
      transaction: transaction,
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
  Future<List<DownloadRecord>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DownloadRecordUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DownloadRecordTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DownloadRecordTable>? orderBy,
    _i1.OrderByListBuilder<DownloadRecordTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DownloadRecord>(
      columnValues: columnValues(DownloadRecord.t.updateTable),
      where: where(DownloadRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DownloadRecord.t),
      orderByList: orderByList?.call(DownloadRecord.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DownloadRecord]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DownloadRecord>> delete(
    _i1.DatabaseSession session,
    List<DownloadRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DownloadRecord>(
      rows,
      transaction: transaction,
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
  Future<List<DownloadRecord>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DownloadRecordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DownloadRecord>(
      where: where(DownloadRecord.t),
      transaction: transaction,
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
