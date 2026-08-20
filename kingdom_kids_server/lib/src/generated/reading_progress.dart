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

abstract class ReadingProgress
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ReadingProgress._({
    this.id,
    required this.child_id,
    required this.book_id,
    required this.current_page,
    required this.completed,
    required this.started_at,
    this.completed_at,
    required this.total_time_seconds,
    required this.synced_at,
  });

  factory ReadingProgress({
    int? id,
    required int child_id,
    required int book_id,
    required int current_page,
    required bool completed,
    required DateTime started_at,
    DateTime? completed_at,
    required int total_time_seconds,
    required DateTime synced_at,
  }) = _ReadingProgressImpl;

  factory ReadingProgress.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReadingProgress(
      id: jsonSerialization['id'] as int?,
      child_id: jsonSerialization['child_id'] as int,
      book_id: jsonSerialization['book_id'] as int,
      current_page: jsonSerialization['current_page'] as int,
      completed: _i1.BoolJsonExtension.fromJson(jsonSerialization['completed']),
      started_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['started_at'],
      ),
      completed_at: jsonSerialization['completed_at'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completed_at'],
            ),
      total_time_seconds: jsonSerialization['total_time_seconds'] as int,
      synced_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['synced_at'],
      ),
    );
  }

  static final t = ReadingProgressTable();

  static const db = ReadingProgressRepository._();

  @override
  int? id;

  int child_id;

  int book_id;

  int current_page;

  bool completed;

  DateTime started_at;

  DateTime? completed_at;

  int total_time_seconds;

  DateTime synced_at;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ReadingProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReadingProgress copyWith({
    int? id,
    int? child_id,
    int? book_id,
    int? current_page,
    bool? completed,
    DateTime? started_at,
    DateTime? completed_at,
    int? total_time_seconds,
    DateTime? synced_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReadingProgress',
      if (id != null) 'id': id,
      'child_id': child_id,
      'book_id': book_id,
      'current_page': current_page,
      'completed': completed,
      'started_at': started_at.toJson(),
      if (completed_at != null) 'completed_at': completed_at?.toJson(),
      'total_time_seconds': total_time_seconds,
      'synced_at': synced_at.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ReadingProgress',
      if (id != null) 'id': id,
      'child_id': child_id,
      'book_id': book_id,
      'current_page': current_page,
      'completed': completed,
      'started_at': started_at.toJson(),
      if (completed_at != null) 'completed_at': completed_at?.toJson(),
      'total_time_seconds': total_time_seconds,
      'synced_at': synced_at.toJson(),
    };
  }

  static ReadingProgressInclude include() {
    return ReadingProgressInclude._();
  }

  static ReadingProgressIncludeList includeList({
    _i1.WhereExpressionBuilder<ReadingProgressTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReadingProgressTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReadingProgressTable>? orderByList,
    ReadingProgressInclude? include,
  }) {
    return ReadingProgressIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReadingProgress.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(ReadingProgress.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReadingProgressImpl extends ReadingProgress {
  _ReadingProgressImpl({
    int? id,
    required int child_id,
    required int book_id,
    required int current_page,
    required bool completed,
    required DateTime started_at,
    DateTime? completed_at,
    required int total_time_seconds,
    required DateTime synced_at,
  }) : super._(
         id: id,
         child_id: child_id,
         book_id: book_id,
         current_page: current_page,
         completed: completed,
         started_at: started_at,
         completed_at: completed_at,
         total_time_seconds: total_time_seconds,
         synced_at: synced_at,
       );

  /// Returns a shallow copy of this [ReadingProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReadingProgress copyWith({
    Object? id = _Undefined,
    int? child_id,
    int? book_id,
    int? current_page,
    bool? completed,
    DateTime? started_at,
    Object? completed_at = _Undefined,
    int? total_time_seconds,
    DateTime? synced_at,
  }) {
    return ReadingProgress(
      id: id is int? ? id : this.id,
      child_id: child_id ?? this.child_id,
      book_id: book_id ?? this.book_id,
      current_page: current_page ?? this.current_page,
      completed: completed ?? this.completed,
      started_at: started_at ?? this.started_at,
      completed_at: completed_at is DateTime?
          ? completed_at
          : this.completed_at,
      total_time_seconds: total_time_seconds ?? this.total_time_seconds,
      synced_at: synced_at ?? this.synced_at,
    );
  }
}

class ReadingProgressUpdateTable extends _i1.UpdateTable<ReadingProgressTable> {
  ReadingProgressUpdateTable(super.table);

  _i1.ColumnValue<int, int> child_id(int value) => _i1.ColumnValue(
    table.child_id,
    value,
  );

  _i1.ColumnValue<int, int> book_id(int value) => _i1.ColumnValue(
    table.book_id,
    value,
  );

  _i1.ColumnValue<int, int> current_page(int value) => _i1.ColumnValue(
    table.current_page,
    value,
  );

  _i1.ColumnValue<bool, bool> completed(bool value) => _i1.ColumnValue(
    table.completed,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> started_at(DateTime value) =>
      _i1.ColumnValue(
        table.started_at,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> completed_at(DateTime? value) =>
      _i1.ColumnValue(
        table.completed_at,
        value,
      );

  _i1.ColumnValue<int, int> total_time_seconds(int value) => _i1.ColumnValue(
    table.total_time_seconds,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> synced_at(DateTime value) =>
      _i1.ColumnValue(
        table.synced_at,
        value,
      );
}

class ReadingProgressTable extends _i1.Table<int?> {
  ReadingProgressTable({super.tableRelation})
    : super(tableName: 'reading_progress') {
    updateTable = ReadingProgressUpdateTable(this);
    child_id = _i1.ColumnInt(
      'child_id',
      this,
    );
    book_id = _i1.ColumnInt(
      'book_id',
      this,
    );
    current_page = _i1.ColumnInt(
      'current_page',
      this,
    );
    completed = _i1.ColumnBool(
      'completed',
      this,
    );
    started_at = _i1.ColumnDateTime(
      'started_at',
      this,
    );
    completed_at = _i1.ColumnDateTime(
      'completed_at',
      this,
    );
    total_time_seconds = _i1.ColumnInt(
      'total_time_seconds',
      this,
    );
    synced_at = _i1.ColumnDateTime(
      'synced_at',
      this,
    );
  }

  late final ReadingProgressUpdateTable updateTable;

  late final _i1.ColumnInt child_id;

  late final _i1.ColumnInt book_id;

  late final _i1.ColumnInt current_page;

  late final _i1.ColumnBool completed;

  late final _i1.ColumnDateTime started_at;

  late final _i1.ColumnDateTime completed_at;

  late final _i1.ColumnInt total_time_seconds;

  late final _i1.ColumnDateTime synced_at;

  @override
  List<_i1.Column> get columns => [
    id,
    child_id,
    book_id,
    current_page,
    completed,
    started_at,
    completed_at,
    total_time_seconds,
    synced_at,
  ];
}

class ReadingProgressInclude extends _i1.IncludeObject {
  ReadingProgressInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ReadingProgress.t;
}

class ReadingProgressIncludeList extends _i1.IncludeList {
  ReadingProgressIncludeList._({
    _i1.WhereExpressionBuilder<ReadingProgressTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ReadingProgress.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ReadingProgress.t;
}

class ReadingProgressRepository {
  const ReadingProgressRepository._();

  /// Returns a list of [ReadingProgress]s matching the given query parameters.
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
  Future<List<ReadingProgress>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReadingProgressTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReadingProgressTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReadingProgressTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ReadingProgress>(
      where: where?.call(ReadingProgress.t),
      orderBy: orderBy?.call(ReadingProgress.t),
      orderByList: orderByList?.call(ReadingProgress.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ReadingProgress] matching the given query parameters.
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
  Future<ReadingProgress?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ReadingProgressTable>? where,
    int? offset,
    _i1.OrderByBuilder<ReadingProgressTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReadingProgressTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ReadingProgress>(
      where: where?.call(ReadingProgress.t),
      orderBy: orderBy?.call(ReadingProgress.t),
      orderByList: orderByList?.call(ReadingProgress.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ReadingProgress] by its [id] or null if no such row exists.
  Future<ReadingProgress?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ReadingProgress>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ReadingProgress]s in the list and returns the inserted rows.
  ///
  /// The returned [ReadingProgress]s will have their `id` fields set.
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
  Future<List<ReadingProgress>> insert(
    _i1.DatabaseSession session,
    List<ReadingProgress> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ReadingProgress>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ReadingProgress] and returns the inserted row.
  ///
  /// The returned [ReadingProgress] will have its `id` field set.
  Future<ReadingProgress> insertRow(
    _i1.DatabaseSession session,
    ReadingProgress row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ReadingProgress>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ReadingProgress]s in the list and returns the resulting rows.
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
  /// The returned [ReadingProgress]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ReadingProgress>> upsert(
    _i1.DatabaseSession session,
    List<ReadingProgress> rows, {
    required _i1.ColumnSelections<ReadingProgressTable> conflictColumns,
    _i1.ColumnSelections<ReadingProgressTable>? updateColumns,
    _i1.WhereExpressionBuilder<ReadingProgressTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ReadingProgress>(
      rows,
      conflictColumns: conflictColumns(ReadingProgress.t),
      updateColumns: updateColumns?.call(ReadingProgress.t),
      updateWhere: updateWhere?.call(ReadingProgress.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ReadingProgress] and returns the resulting row.
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
  /// The returned [ReadingProgress] will have its `id` field set.
  Future<ReadingProgress?> upsertRow(
    _i1.DatabaseSession session,
    ReadingProgress row, {
    required _i1.ColumnSelections<ReadingProgressTable> conflictColumns,
    _i1.ColumnSelections<ReadingProgressTable>? updateColumns,
    _i1.WhereExpressionBuilder<ReadingProgressTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ReadingProgress>(
      row,
      conflictColumns: conflictColumns(ReadingProgress.t),
      updateColumns: updateColumns?.call(ReadingProgress.t),
      updateWhere: updateWhere?.call(ReadingProgress.t),
      transaction: transaction,
    );
  }

  /// Updates all [ReadingProgress]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ReadingProgress>> update(
    _i1.DatabaseSession session,
    List<ReadingProgress> rows, {
    _i1.ColumnSelections<ReadingProgressTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ReadingProgress>(
      rows,
      columns: columns?.call(ReadingProgress.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ReadingProgress]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ReadingProgress> updateRow(
    _i1.DatabaseSession session,
    ReadingProgress row, {
    _i1.ColumnSelections<ReadingProgressTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ReadingProgress>(
      row,
      columns: columns?.call(ReadingProgress.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ReadingProgress] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ReadingProgress?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ReadingProgressUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ReadingProgress>(
      id,
      columnValues: columnValues(ReadingProgress.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ReadingProgress]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ReadingProgress>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ReadingProgressUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<ReadingProgressTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ReadingProgressTable>? orderBy,
    _i1.OrderByListBuilder<ReadingProgressTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ReadingProgress>(
      columnValues: columnValues(ReadingProgress.t.updateTable),
      where: where(ReadingProgress.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ReadingProgress.t),
      orderByList: orderByList?.call(ReadingProgress.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ReadingProgress]s in the list and returns the deleted rows.
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
  Future<List<ReadingProgress>> delete(
    _i1.DatabaseSession session,
    List<ReadingProgress> rows, {
    _i1.OrderByBuilder<ReadingProgressTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReadingProgressTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ReadingProgress>(
      rows,
      orderBy: orderBy?.call(ReadingProgress.t),
      orderByList: orderByList?.call(ReadingProgress.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ReadingProgress].
  Future<ReadingProgress> deleteRow(
    _i1.DatabaseSession session,
    ReadingProgress row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ReadingProgress>(
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
  Future<List<ReadingProgress>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ReadingProgressTable> where,
    _i1.OrderByBuilder<ReadingProgressTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ReadingProgressTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ReadingProgress>(
      where: where(ReadingProgress.t),
      orderBy: orderBy?.call(ReadingProgress.t),
      orderByList: orderByList?.call(ReadingProgress.t),
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
    _i1.WhereExpressionBuilder<ReadingProgressTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ReadingProgress>(
      where: where?.call(ReadingProgress.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ReadingProgress] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ReadingProgressTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ReadingProgress>(
      where: where(ReadingProgress.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
