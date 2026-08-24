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

abstract class ChildProfile
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      pinProtected: _is.BoolJsonExtension.fromJson(
        jsonSerialization['pinProtected'],
      ),
      createdAt: _is.DateTimeJsonExtension.fromJson(
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
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ChildProfile]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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
    _is.WhereExpressionBuilder<ChildProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ChildProfileTable>? orderBy,
    _is.OrderByListBuilder<ChildProfileTable>? orderByList,
    ChildProfileInclude? include,
  }) {
    return ChildProfileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class ChildProfileUpdateTable extends _is.UpdateTable<ChildProfileTable> {
  ChildProfileUpdateTable(super.table);

  _is.ColumnValue<int, int> parentId(int value) => _is.ColumnValue(
    table.parentId,
    value,
  );

  _is.ColumnValue<String, String> displayName(String value) => _is.ColumnValue(
    table.displayName,
    value,
  );

  _is.ColumnValue<int, int> birthYear(int value) => _is.ColumnValue(
    table.birthYear,
    value,
  );

  _is.ColumnValue<String, String> ageBracket(String value) => _is.ColumnValue(
    table.ageBracket,
    value,
  );

  _is.ColumnValue<String, String> preferredLanguage(String value) =>
      _is.ColumnValue(
        table.preferredLanguage,
        value,
      );

  _is.ColumnValue<String, String> avatarId(String value) => _is.ColumnValue(
    table.avatarId,
    value,
  );

  _is.ColumnValue<bool, bool> pinProtected(bool value) => _is.ColumnValue(
    table.pinProtected,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class ChildProfileTable extends _is.Table<int?> {
  ChildProfileTable({super.tableRelation})
    : super(tableName: 'child_profiles') {
    updateTable = ChildProfileUpdateTable(this);
    parentId = _is.ColumnInt(
      'parentId',
      this,
    );
    displayName = _is.ColumnString(
      'displayName',
      this,
    );
    birthYear = _is.ColumnInt(
      'birthYear',
      this,
    );
    ageBracket = _is.ColumnString(
      'ageBracket',
      this,
    );
    preferredLanguage = _is.ColumnString(
      'preferredLanguage',
      this,
    );
    avatarId = _is.ColumnString(
      'avatarId',
      this,
    );
    pinProtected = _is.ColumnBool(
      'pinProtected',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ChildProfileUpdateTable updateTable;

  late final _is.ColumnInt parentId;

  late final _is.ColumnString displayName;

  late final _is.ColumnInt birthYear;

  late final _is.ColumnString ageBracket;

  late final _is.ColumnString preferredLanguage;

  late final _is.ColumnString avatarId;

  late final _is.ColumnBool pinProtected;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
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

class ChildProfileInclude extends _is.IncludeObject {
  ChildProfileInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ChildProfile.t;
}

class ChildProfileIncludeList extends _is.IncludeList {
  ChildProfileIncludeList._({
    _is.WhereExpressionBuilder<ChildProfileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ChildProfile.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ChildProfile.t;
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ChildProfileTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ChildProfileTable>? orderBy,
    _is.OrderByListBuilder<ChildProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ChildProfile>(
      where: where?.call(ChildProfile.t),
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ChildProfileTable>? where,
    int? offset,
    _is.OrderByBuilder<ChildProfileTable>? orderBy,
    _is.OrderByListBuilder<ChildProfileTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ChildProfile>(
      where: where?.call(ChildProfile.t),
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ChildProfile] by its [id] or null if no such row exists.
  Future<ChildProfile?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
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
    _is.DatabaseSession session,
    List<ChildProfile> rows, {
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    ChildProfile row, {
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    List<ChildProfile> rows, {
    required _is.ColumnSelections<ChildProfileTable> conflictColumns,
    _is.ColumnSelections<ChildProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<ChildProfileTable>? updateWhere,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    ChildProfile row, {
    required _is.ColumnSelections<ChildProfileTable> conflictColumns,
    _is.ColumnSelections<ChildProfileTable>? updateColumns,
    _is.WhereExpressionBuilder<ChildProfileTable>? updateWhere,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    List<ChildProfile> rows, {
    _is.ColumnSelections<ChildProfileTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    ChildProfile row, {
    _is.ColumnSelections<ChildProfileTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ChildProfileUpdateTable> columnValues,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ChildProfileUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ChildProfileTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ChildProfileTable>? orderBy,
    _is.OrderByListBuilder<ChildProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ChildProfile>(
      columnValues: columnValues(ChildProfile.t.updateTable),
      where: where(ChildProfile.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
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
    _is.DatabaseSession session,
    List<ChildProfile> rows, {
    _is.OrderByBuilder<ChildProfileTable>? orderBy,
    _is.OrderByListBuilder<ChildProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ChildProfile>(
      rows,
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ChildProfile].
  Future<ChildProfile> deleteRow(
    _is.DatabaseSession session,
    ChildProfile row, {
    _is.Transaction? transaction,
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
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ChildProfileTable> where,
    _is.OrderByBuilder<ChildProfileTable>? orderBy,
    _is.OrderByListBuilder<ChildProfileTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ChildProfile>(
      where: where(ChildProfile.t),
      orderBy: orderBy?.call(ChildProfile.t),
      orderByList: orderByList?.call(ChildProfile.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ChildProfileTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ChildProfile>(
      where: where?.call(ChildProfile.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ChildProfile] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ChildProfileTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ChildProfile>(
      where: where(ChildProfile.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
