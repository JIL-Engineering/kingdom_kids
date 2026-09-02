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

abstract class ChildProfile
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ChildProfile._({
    this.id,
    required this.parentId,
    required this.displayName,
    required this.birthYear,
    required this.ageBracket,
    required this.preferredLanguage,
    required this.avatarId,
    required this.pinProtected,
    required this.createdAt,
  });

  factory ChildProfile({
    int? id,
    required int parentId,
    required String displayName,
    required int birthYear,
    required String ageBracket,
    required String preferredLanguage,
    required String avatarId,
    required bool pinProtected,
    required DateTime createdAt,
  }) = _ChildProfileImpl;

  factory ChildProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChildProfile(
      id: jsonSerialization['id'] as int?,
      parentId: jsonSerialization['parentId'] as int,
      displayName: jsonSerialization['displayName'] as String,
      birthYear: jsonSerialization['birthYear'] as int,
      ageBracket: jsonSerialization['ageBracket'] as String,
      preferredLanguage: jsonSerialization['preferredLanguage'] as String,
      avatarId: jsonSerialization['avatarId'] as String,
      pinProtected: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['pinProtected'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ChildProfileTable();

  static const db = ChildProfileRepository._();

  @override
  int? id;

  int parentId;

  String displayName;

  int birthYear;

  String ageBracket;

  String preferredLanguage;

  String avatarId;

  bool pinProtected;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ChildProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChildProfile copyWith({
    int? id,
    int? parentId,
    String? displayName,
    int? birthYear,
    String? ageBracket,
    String? preferredLanguage,
    String? avatarId,
    bool? pinProtected,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChildProfile',
      if (id != null) 'id': id,
      'parentId': parentId,
      'displayName': displayName,
      'birthYear': birthYear,
      'ageBracket': ageBracket,
      'preferredLanguage': preferredLanguage,
      'avatarId': avatarId,
      'pinProtected': pinProtected,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ChildProfile',
      if (id != null) 'id': id,
      'parentId': parentId,
      'displayName': displayName,
      'birthYear': birthYear,
      'ageBracket': ageBracket,
      'preferredLanguage': preferredLanguage,
      'avatarId': avatarId,
      'pinProtected': pinProtected,
      'createdAt': createdAt.toJson(),
    };
  }

  static ChildProfileInclude include() {
    return ChildProfileInclude._();
  }

  static ChildProfileIncludeList includeList({
    _i1.WhereExpressionBuilder<ChildProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildProfileTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildProfileTable>? orderByList,
    ChildProfileInclude? include,
  }) {
    return ChildProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChildProfile.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(ChildProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChildProfileImpl extends ChildProfile {
  _ChildProfileImpl({
    int? id,
    required int parentId,
    required String displayName,
    required int birthYear,
    required String ageBracket,
    required String preferredLanguage,
    required String avatarId,
    required bool pinProtected,
    required DateTime createdAt,
  }) : super._(
         id: id,
         parentId: parentId,
         displayName: displayName,
         birthYear: birthYear,
         ageBracket: ageBracket,
         preferredLanguage: preferredLanguage,
         avatarId: avatarId,
         pinProtected: pinProtected,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [ChildProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChildProfile copyWith({
    Object? id = _Undefined,
    int? parentId,
    String? displayName,
    int? birthYear,
    String? ageBracket,
    String? preferredLanguage,
    String? avatarId,
    bool? pinProtected,
    DateTime? createdAt,
  }) {
    return ChildProfile(
      id: id is int? ? id : this.id,
      parentId: parentId ?? this.parentId,
      displayName: displayName ?? this.displayName,
      birthYear: birthYear ?? this.birthYear,
      ageBracket: ageBracket ?? this.ageBracket,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      avatarId: avatarId ?? this.avatarId,
      pinProtected: pinProtected ?? this.pinProtected,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ChildProfileUpdateTable extends _i1.UpdateTable<ChildProfileTable> {
  ChildProfileUpdateTable(super.table);

  _i1.ColumnValue<int, int> parentId(int value) => _i1.ColumnValue(
    table.parentId,
    value,
  );

  _i1.ColumnValue<String, String> displayName(String value) => _i1.ColumnValue(
    table.displayName,
    value,
  );

  _i1.ColumnValue<int, int> birthYear(int value) => _i1.ColumnValue(
    table.birthYear,
    value,
  );

  _i1.ColumnValue<String, String> ageBracket(String value) => _i1.ColumnValue(
    table.ageBracket,
    value,
  );

  _i1.ColumnValue<String, String> preferredLanguage(String value) =>
      _i1.ColumnValue(
        table.preferredLanguage,
        value,
      );

  _i1.ColumnValue<String, String> avatarId(String value) => _i1.ColumnValue(
    table.avatarId,
    value,
  );

  _i1.ColumnValue<bool, bool> pinProtected(bool value) => _i1.ColumnValue(
    table.pinProtected,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ChildProfileTable extends _i1.Table<int?> {
  ChildProfileTable({super.tableRelation})
    : super(tableName: 'child_profiles') {
    updateTable = ChildProfileUpdateTable(this);
    parentId = _i1.ColumnInt(
      'parentId',
      this,
    );
    displayName = _i1.ColumnString(
      'displayName',
      this,
    );
    birthYear = _i1.ColumnInt(
      'birthYear',
      this,
    );
    ageBracket = _i1.ColumnString(
      'ageBracket',
      this,
    );
    preferredLanguage = _i1.ColumnString(
      'preferredLanguage',
      this,
    );
    avatarId = _i1.ColumnString(
      'avatarId',
      this,
    );
    pinProtected = _i1.ColumnBool(
      'pinProtected',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ChildProfileUpdateTable updateTable;

  late final _i1.ColumnInt parentId;

  late final _i1.ColumnString displayName;

  late final _i1.ColumnInt birthYear;

  late final _i1.ColumnString ageBracket;

  late final _i1.ColumnString preferredLanguage;

  late final _i1.ColumnString avatarId;

  late final _i1.ColumnBool pinProtected;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    parentId,
    displayName,
    birthYear,
    ageBracket,
    preferredLanguage,
    avatarId,
    pinProtected,
    createdAt,
  ];
}

class ChildProfileInclude extends _i1.IncludeObject {
  ChildProfileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ChildProfile.t;
}

class ChildProfileIncludeList extends _i1.IncludeList {
  ChildProfileIncludeList._({
    _i1.WhereExpressionBuilder<ChildProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ChildProfile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ChildProfile.t;
}

class ChildProfileRepository {
  const ChildProfileRepository._();

  /// Returns a list of [ChildProfile]s matching the given query parameters.
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
  Future<List<ChildProfile>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChildProfileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildProfileTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildProfileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ChildProfile>(
      where: where?.call(ChildProfile.t),
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [ChildProfile] matching the given query parameters.
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
  Future<ChildProfile?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ChildProfileTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChildProfileTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildProfileTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ChildProfile>(
      where: where?.call(ChildProfile.t),
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ChildProfile] by its [id] or null if no such row exists.
  Future<ChildProfile?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ChildProfile>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ChildProfile]s in the list and returns the inserted rows.
  ///
  /// The returned [ChildProfile]s will have their `id` fields set.
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
  Future<List<ChildProfile>> insert(
    _i1.DatabaseSession session,
    List<ChildProfile> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ChildProfile>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ChildProfile] and returns the inserted row.
  ///
  /// The returned [ChildProfile] will have its `id` field set.
  Future<ChildProfile> insertRow(
    _i1.DatabaseSession session,
    ChildProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ChildProfile>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ChildProfile]s in the list and returns the resulting rows.
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
  /// The returned [ChildProfile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ChildProfile>> upsert(
    _i1.DatabaseSession session,
    List<ChildProfile> rows, {
    required _i1.ColumnSelections<ChildProfileTable> conflictColumns,
    _i1.ColumnSelections<ChildProfileTable>? updateColumns,
    _i1.WhereExpressionBuilder<ChildProfileTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ChildProfile>(
      rows,
      conflictColumns: conflictColumns(ChildProfile.t),
      updateColumns: updateColumns?.call(ChildProfile.t),
      updateWhere: updateWhere?.call(ChildProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ChildProfile] and returns the resulting row.
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
  /// The returned [ChildProfile] will have its `id` field set.
  Future<ChildProfile?> upsertRow(
    _i1.DatabaseSession session,
    ChildProfile row, {
    required _i1.ColumnSelections<ChildProfileTable> conflictColumns,
    _i1.ColumnSelections<ChildProfileTable>? updateColumns,
    _i1.WhereExpressionBuilder<ChildProfileTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ChildProfile>(
      row,
      conflictColumns: conflictColumns(ChildProfile.t),
      updateColumns: updateColumns?.call(ChildProfile.t),
      updateWhere: updateWhere?.call(ChildProfile.t),
      transaction: transaction,
    );
  }

  /// Updates all [ChildProfile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ChildProfile>> update(
    _i1.DatabaseSession session,
    List<ChildProfile> rows, {
    _i1.ColumnSelections<ChildProfileTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ChildProfile>(
      rows,
      columns: columns?.call(ChildProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ChildProfile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ChildProfile> updateRow(
    _i1.DatabaseSession session,
    ChildProfile row, {
    _i1.ColumnSelections<ChildProfileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ChildProfile>(
      row,
      columns: columns?.call(ChildProfile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ChildProfile] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ChildProfile?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ChildProfileUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ChildProfile>(
      id,
      columnValues: columnValues(ChildProfile.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ChildProfile]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ChildProfile>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ChildProfileUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ChildProfileTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChildProfileTable>? orderBy,
    _i1.OrderByListBuilder<ChildProfileTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ChildProfile>(
      columnValues: columnValues(ChildProfile.t.updateTable),
      where: where(ChildProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ChildProfile]s in the list and returns the deleted rows.
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
  Future<List<ChildProfile>> delete(
    _i1.DatabaseSession session,
    List<ChildProfile> rows, {
    _i1.OrderByBuilder<ChildProfileTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildProfileTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ChildProfile>(
      rows,
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ChildProfile].
  Future<ChildProfile> deleteRow(
    _i1.DatabaseSession session,
    ChildProfile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ChildProfile>(
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
  Future<List<ChildProfile>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChildProfileTable> where,
    _i1.OrderByBuilder<ChildProfileTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChildProfileTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ChildProfile>(
      where: where(ChildProfile.t),
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
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
    _i1.WhereExpressionBuilder<ChildProfileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ChildProfile>(
      where: where?.call(ChildProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ChildProfile] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ChildProfileTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ChildProfile>(
      where: where(ChildProfile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
