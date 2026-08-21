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

abstract class ChildBadge
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ChildBadge._({
    this.id,
    required this.childId,
    required this.badgeId,
    required this.earnedAt,
  });

  factory ChildBadge({
    int? id,
    required int childId,
    required int badgeId,
    required DateTime earnedAt,
  }) = _ChildBadgeImpl;

  factory ChildBadge.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChildBadge(
      id: jsonSerialization['id'] as int?,
      childId: jsonSerialization['childId'] as int,
      badgeId: jsonSerialization['badgeId'] as int,
      earnedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['earnedAt'],
      ),
    );
  }

  static final t = ChildBadgeTable();

  static const db = ChildBadgeRepository._();

  @override
  int? id;

  int childId;

  int badgeId;

  DateTime earnedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ChildBadge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChildBadge copyWith({
    int? id,
    int? childId,
    int? badgeId,
    DateTime? earnedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChildBadge',
      if (id != null) 'id': id,
      'childId': childId,
      'badgeId': badgeId,
      'earnedAt': earnedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ChildBadge',
      if (id != null) 'id': id,
      'childId': childId,
      'badgeId': badgeId,
      'earnedAt': earnedAt.toJson(),
    };
  }

  static ChildBadgeInclude include() {
    return ChildBadgeInclude._();
  }

  static ChildBadgeIncludeList includeList({
    _i1.WhereExpressionBuilder<ChildBadgeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildBadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildBadgeTable>? orderByList,
    ChildBadgeInclude? include,
  }) {
    return ChildBadgeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChildBadge.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(ChildBadge.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChildBadgeImpl extends ChildBadge {
  _ChildBadgeImpl({
    int? id,
    required int childId,
    required int badgeId,
    required DateTime earnedAt,
  }) : super._(
         id: id,
         childId: childId,
         badgeId: badgeId,
         earnedAt: earnedAt,
       );

  /// Returns a shallow copy of this [ChildBadge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChildBadge copyWith({
    Object? id = _Undefined,
    int? childId,
    int? badgeId,
    DateTime? earnedAt,
  }) {
    return ChildBadge(
      id: id is int? ? id : this.id,
      childId: childId ?? this.childId,
      badgeId: badgeId ?? this.badgeId,
      earnedAt: earnedAt ?? this.earnedAt,
    );
  }
}

class ChildBadgeUpdateTable extends _i1.UpdateTable<ChildBadgeTable> {
  ChildBadgeUpdateTable(super.table);

  _i1.ColumnValue<int, int> childId(int value) => _i1.ColumnValue(
    table.childId,
    value,
  );

  _i1.ColumnValue<int, int> badgeId(int value) => _i1.ColumnValue(
    table.badgeId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> earnedAt(DateTime value) =>
      _i1.ColumnValue(
        table.earnedAt,
        value,
      );
}

class ChildBadgeTable extends _i1.Table<int?> {
  ChildBadgeTable({super.tableRelation}) : super(tableName: 'child_badge') {
    updateTable = ChildBadgeUpdateTable(this);
    childId = _i1.ColumnInt(
      'childId',
      this,
    );
    badgeId = _i1.ColumnInt(
      'badgeId',
      this,
    );
    earnedAt = _i1.ColumnDateTime(
      'earnedAt',
      this,
    );
  }

  late final ChildBadgeUpdateTable updateTable;

  late final _i1.ColumnInt childId;

  late final _i1.ColumnInt badgeId;

  late final _i1.ColumnDateTime earnedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    childId,
    badgeId,
    earnedAt,
  ];
}

class ChildBadgeInclude extends _i1.IncludeObject {
  ChildBadgeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ChildBadge.t;
}

class ChildBadgeIncludeList extends _i1.IncludeList {
  ChildBadgeIncludeList._({
    _i1.WhereExpressionBuilder<ChildBadgeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ChildBadge.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ChildBadge.t;
}

class ChildBadgeRepository {
  const ChildBadgeRepository._();

  /// Returns a list of [ChildBadge]s matching the given query parameters.
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
  Future<List<ChildBadge>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChildBadgeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildBadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildBadgeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ChildBadge>(
      where: where?.call(ChildBadge.t),
      orderBy: orderBy?.call(ChildBadge.t),
      orderByList: orderByList?.call(ChildBadge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ChildBadge] matching the given query parameters.
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
  Future<ChildBadge?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChildBadgeTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChildBadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildBadgeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ChildBadge>(
      where: where?.call(ChildBadge.t),
      orderBy: orderBy?.call(ChildBadge.t),
      orderByList: orderByList?.call(ChildBadge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ChildBadge] by its [id] or null if no such row exists.
  Future<ChildBadge?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ChildBadge>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ChildBadge]s in the list and returns the inserted rows.
  ///
  /// The returned [ChildBadge]s will have their `id` fields set.
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
  Future<List<ChildBadge>> insert(
    _i1.DatabaseSession session,
    List<ChildBadge> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ChildBadge>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ChildBadge] and returns the inserted row.
  ///
  /// The returned [ChildBadge] will have its `id` field set.
  Future<ChildBadge> insertRow(
    _i1.DatabaseSession session,
    ChildBadge row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ChildBadge>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ChildBadge]s in the list and returns the resulting rows.
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
  /// The returned [ChildBadge]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ChildBadge>> upsert(
    _i1.DatabaseSession session,
    List<ChildBadge> rows, {
    required _i1.ColumnSelections<ChildBadgeTable> conflictColumns,
    _i1.ColumnSelections<ChildBadgeTable>? updateColumns,
    _i1.WhereExpressionBuilder<ChildBadgeTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ChildBadge>(
      rows,
      conflictColumns: conflictColumns(ChildBadge.t),
      updateColumns: updateColumns?.call(ChildBadge.t),
      updateWhere: updateWhere?.call(ChildBadge.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ChildBadge] and returns the resulting row.
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
  /// The returned [ChildBadge] will have its `id` field set.
  Future<ChildBadge?> upsertRow(
    _i1.DatabaseSession session,
    ChildBadge row, {
    required _i1.ColumnSelections<ChildBadgeTable> conflictColumns,
    _i1.ColumnSelections<ChildBadgeTable>? updateColumns,
    _i1.WhereExpressionBuilder<ChildBadgeTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ChildBadge>(
      row,
      conflictColumns: conflictColumns(ChildBadge.t),
      updateColumns: updateColumns?.call(ChildBadge.t),
      updateWhere: updateWhere?.call(ChildBadge.t),
      transaction: transaction,
    );
  }

  /// Updates all [ChildBadge]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ChildBadge>> update(
    _i1.DatabaseSession session,
    List<ChildBadge> rows, {
    _i1.ColumnSelections<ChildBadgeTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ChildBadge>(
      rows,
      columns: columns?.call(ChildBadge.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ChildBadge]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ChildBadge> updateRow(
    _i1.DatabaseSession session,
    ChildBadge row, {
    _i1.ColumnSelections<ChildBadgeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ChildBadge>(
      row,
      columns: columns?.call(ChildBadge.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChildBadge] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ChildBadge?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ChildBadgeUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ChildBadge>(
      id,
      columnValues: columnValues(ChildBadge.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ChildBadge]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ChildBadge>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ChildBadgeUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ChildBadgeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildBadgeTable>? orderBy,
    _i1.OrderByListBuilder<ChildBadgeTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ChildBadge>(
      columnValues: columnValues(ChildBadge.t.updateTable),
      where: where(ChildBadge.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChildBadge.t),
      orderByList: orderByList?.call(ChildBadge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ChildBadge]s in the list and returns the deleted rows.
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
  Future<List<ChildBadge>> delete(
    _i1.DatabaseSession session,
    List<ChildBadge> rows, {
    _i1.OrderByBuilder<ChildBadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildBadgeTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ChildBadge>(
      rows,
      orderBy: orderBy?.call(ChildBadge.t),
      orderByList: orderByList?.call(ChildBadge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ChildBadge].
  Future<ChildBadge> deleteRow(
    _i1.DatabaseSession session,
    ChildBadge row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ChildBadge>(
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
  Future<List<ChildBadge>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChildBadgeTable> where,
    _i1.OrderByBuilder<ChildBadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildBadgeTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ChildBadge>(
      where: where(ChildBadge.t),
      orderBy: orderBy?.call(ChildBadge.t),
      orderByList: orderByList?.call(ChildBadge.t),
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
    _i1.WhereExpressionBuilder<ChildBadgeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ChildBadge>(
      where: where?.call(ChildBadge.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ChildBadge] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChildBadgeTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ChildBadge>(
      where: where(ChildBadge.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
