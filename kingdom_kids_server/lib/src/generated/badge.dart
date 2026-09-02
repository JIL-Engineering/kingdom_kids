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

abstract class Badge implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Badge._({
    this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.iconAsset,
    required this.triggerRule,
  });

  factory Badge({
    int? id,
    required String code,
    required String name,
    required String description,
    required String iconAsset,
    required String triggerRule,
  }) = _BadgeImpl;

  factory Badge.fromJson(Map<String, dynamic> jsonSerialization) {
    return Badge(
      id: jsonSerialization['id'] as int?,
      code: jsonSerialization['code'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      iconAsset: jsonSerialization['iconAsset'] as String,
      triggerRule: jsonSerialization['triggerRule'] as String,
    );
  }

  static final t = BadgeTable();

  static const db = BadgeRepository._();

  @override
  int? id;

  String code;

  String name;

  String description;

  String iconAsset;

  String triggerRule;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Badge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Badge copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    String? iconAsset,
    String? triggerRule,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Badge',
      if (id != null) 'id': id,
      'code': code,
      'name': name,
      'description': description,
      'iconAsset': iconAsset,
      'triggerRule': triggerRule,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Badge',
      if (id != null) 'id': id,
      'code': code,
      'name': name,
      'description': description,
      'iconAsset': iconAsset,
      'triggerRule': triggerRule,
    };
  }

  static BadgeInclude include() {
    return BadgeInclude._();
  }

  static BadgeIncludeList includeList({
    _i1.WhereExpressionBuilder<BadgeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BadgeTable>? orderByList,
    BadgeInclude? include,
  }) {
    return BadgeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Badge.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(Badge.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BadgeImpl extends Badge {
  _BadgeImpl({
    int? id,
    required String code,
    required String name,
    required String description,
    required String iconAsset,
    required String triggerRule,
  }) : super._(
         id: id,
         code: code,
         name: name,
         description: description,
         iconAsset: iconAsset,
         triggerRule: triggerRule,
       );

  /// Returns a shallow copy of this [Badge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Badge copyWith({
    Object? id = _Undefined,
    String? code,
    String? name,
    String? description,
    String? iconAsset,
    String? triggerRule,
  }) {
    return Badge(
      id: id is int? ? id : this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      iconAsset: iconAsset ?? this.iconAsset,
      triggerRule: triggerRule ?? this.triggerRule,
    );
  }
}

class BadgeUpdateTable extends _i1.UpdateTable<BadgeTable> {
  BadgeUpdateTable(super.table);

  _i1.ColumnValue<String, String> code(String value) => _i1.ColumnValue(
    table.code,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> iconAsset(String value) => _i1.ColumnValue(
    table.iconAsset,
    value,
  );

  _i1.ColumnValue<String, String> triggerRule(String value) => _i1.ColumnValue(
    table.triggerRule,
    value,
  );
}

class BadgeTable extends _i1.Table<int?> {
  BadgeTable({super.tableRelation}) : super(tableName: 'badges') {
    updateTable = BadgeUpdateTable(this);
    code = _i1.ColumnString(
      'code',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    iconAsset = _i1.ColumnString(
      'iconAsset',
      this,
    );
    triggerRule = _i1.ColumnString(
      'triggerRule',
      this,
    );
  }

  late final BadgeUpdateTable updateTable;

  late final _i1.ColumnString code;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString iconAsset;

  late final _i1.ColumnString triggerRule;

  @override
  List<_i1.Column> get columns => [
    id,
    code,
    name,
    description,
    iconAsset,
    triggerRule,
  ];
}

class BadgeInclude extends _i1.IncludeObject {
  BadgeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Badge.t;
}

class BadgeIncludeList extends _i1.IncludeList {
  BadgeIncludeList._({
    _i1.WhereExpressionBuilder<BadgeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Badge.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Badge.t;
}

class BadgeRepository {
  const BadgeRepository._();

  /// Returns a list of [Badge]s matching the given query parameters.
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
  Future<List<Badge>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BadgeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BadgeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Badge>(
      where: where?.call(Badge.t),
      orderBy: orderBy?.call(Badge.t),
      orderByList: orderByList?.call(Badge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Badge] matching the given query parameters.
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
  Future<Badge?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BadgeTable>? where,
    int? offset,
    _i1.OrderByBuilder<BadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BadgeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Badge>(
      where: where?.call(Badge.t),
      orderBy: orderBy?.call(Badge.t),
      orderByList: orderByList?.call(Badge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Badge] by its [id] or null if no such row exists.
  Future<Badge?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Badge>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Badge]s in the list and returns the inserted rows.
  ///
  /// The returned [Badge]s will have their `id` fields set.
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
  Future<List<Badge>> insert(
    _i1.DatabaseSession session,
    List<Badge> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Badge>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Badge] and returns the inserted row.
  ///
  /// The returned [Badge] will have its `id` field set.
  Future<Badge> insertRow(
    _i1.DatabaseSession session,
    Badge row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Badge>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Badge]s in the list and returns the resulting rows.
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
  /// The returned [Badge]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Badge>> upsert(
    _i1.DatabaseSession session,
    List<Badge> rows, {
    required _i1.ColumnSelections<BadgeTable> conflictColumns,
    _i1.ColumnSelections<BadgeTable>? updateColumns,
    _i1.WhereExpressionBuilder<BadgeTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Badge>(
      rows,
      conflictColumns: conflictColumns(Badge.t),
      updateColumns: updateColumns?.call(Badge.t),
      updateWhere: updateWhere?.call(Badge.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Badge] and returns the resulting row.
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
  /// The returned [Badge] will have its `id` field set.
  Future<Badge?> upsertRow(
    _i1.DatabaseSession session,
    Badge row, {
    required _i1.ColumnSelections<BadgeTable> conflictColumns,
    _i1.ColumnSelections<BadgeTable>? updateColumns,
    _i1.WhereExpressionBuilder<BadgeTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Badge>(
      row,
      conflictColumns: conflictColumns(Badge.t),
      updateColumns: updateColumns?.call(Badge.t),
      updateWhere: updateWhere?.call(Badge.t),
      transaction: transaction,
    );
  }

  /// Updates all [Badge]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Badge>> update(
    _i1.DatabaseSession session,
    List<Badge> rows, {
    _i1.ColumnSelections<BadgeTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Badge>(
      rows,
      columns: columns?.call(Badge.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Badge]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Badge> updateRow(
    _i1.DatabaseSession session,
    Badge row, {
    _i1.ColumnSelections<BadgeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Badge>(
      row,
      columns: columns?.call(Badge.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Badge] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Badge?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<BadgeUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Badge>(
      id,
      columnValues: columnValues(Badge.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Badge]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Badge>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<BadgeUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<BadgeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BadgeTable>? orderBy,
    _i1.OrderByListBuilder<BadgeTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Badge>(
      columnValues: columnValues(Badge.t.updateTable),
      where: where(Badge.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Badge.t),
      orderByList: orderByList?.call(Badge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Badge]s in the list and returns the deleted rows.
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
  Future<List<Badge>> delete(
    _i1.DatabaseSession session,
    List<Badge> rows, {
    _i1.OrderByBuilder<BadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BadgeTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Badge>(
      rows,
      orderBy: orderBy?.call(Badge.t),
      orderByList: orderByList?.call(Badge.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Badge].
  Future<Badge> deleteRow(
    _i1.DatabaseSession session,
    Badge row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Badge>(
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
  Future<List<Badge>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<BadgeTable> where,
    _i1.OrderByBuilder<BadgeTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<BadgeTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Badge>(
      where: where(Badge.t),
      orderBy: orderBy?.call(Badge.t),
      orderByList: orderByList?.call(Badge.t),
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
    _i1.WhereExpressionBuilder<BadgeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Badge>(
      where: where?.call(Badge.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Badge] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<BadgeTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Badge>(
      where: where(Badge.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
