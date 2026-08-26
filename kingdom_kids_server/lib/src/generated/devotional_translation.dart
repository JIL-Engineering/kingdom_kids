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

abstract class DevotionalTranslation
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  DevotionalTranslation._({
    this.id,
    required this.devotionalId,
    required this.language,
    required this.verseReference,
    required this.verseText,
    required this.thoughtText,
    required this.prayerPrompt,
  });

  factory DevotionalTranslation({
    int? id,
    required int devotionalId,
    required String language,
    required String verseReference,
    required String verseText,
    required String thoughtText,
    required String prayerPrompt,
  }) = _DevotionalTranslationImpl;

  factory DevotionalTranslation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DevotionalTranslation(
      id: jsonSerialization['id'] as int?,
      devotionalId: jsonSerialization['devotionalId'] as int,
      language: jsonSerialization['language'] as String,
      verseReference: jsonSerialization['verseReference'] as String,
      verseText: jsonSerialization['verseText'] as String,
      thoughtText: jsonSerialization['thoughtText'] as String,
      prayerPrompt: jsonSerialization['prayerPrompt'] as String,
    );
  }

  static final t = DevotionalTranslationTable();

  static const db = DevotionalTranslationRepository._();

  @override
  int? id;

  int devotionalId;

  String language;

  String verseReference;

  String verseText;

  String thoughtText;

  String prayerPrompt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  DevotionalTranslation copyWith({
    int? id,
    int? devotionalId,
    String? language,
    String? verseReference,
    String? verseText,
    String? thoughtText,
    String? prayerPrompt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DevotionalTranslation',
      if (id != null) 'id': id,
      'devotionalId': devotionalId,
      'language': language,
      'verseReference': verseReference,
      'verseText': verseText,
      'thoughtText': thoughtText,
      'prayerPrompt': prayerPrompt,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DevotionalTranslation',
      if (id != null) 'id': id,
      'devotionalId': devotionalId,
      'language': language,
      'verseReference': verseReference,
      'verseText': verseText,
      'thoughtText': thoughtText,
      'prayerPrompt': prayerPrompt,
    };
  }

  static DevotionalTranslationInclude include() {
    return DevotionalTranslationInclude._();
  }

  static DevotionalTranslationIncludeList includeList({
    _is.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _is.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    DevotionalTranslationInclude? include,
  }) {
    return DevotionalTranslationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DevotionalTranslationImpl extends DevotionalTranslation {
  _DevotionalTranslationImpl({
    int? id,
    required int devotionalId,
    required String language,
    required String verseReference,
    required String verseText,
    required String thoughtText,
    required String prayerPrompt,
  }) : super._(
         id: id,
         devotionalId: devotionalId,
         language: language,
         verseReference: verseReference,
         verseText: verseText,
         thoughtText: thoughtText,
         prayerPrompt: prayerPrompt,
       );

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  DevotionalTranslation copyWith({
    Object? id = _Undefined,
    int? devotionalId,
    String? language,
    String? verseReference,
    String? verseText,
    String? thoughtText,
    String? prayerPrompt,
  }) {
    return DevotionalTranslation(
      id: id is int? ? id : this.id,
      devotionalId: devotionalId ?? this.devotionalId,
      language: language ?? this.language,
      verseReference: verseReference ?? this.verseReference,
      verseText: verseText ?? this.verseText,
      thoughtText: thoughtText ?? this.thoughtText,
      prayerPrompt: prayerPrompt ?? this.prayerPrompt,
    );
  }
}

class DevotionalTranslationUpdateTable
    extends _is.UpdateTable<DevotionalTranslationTable> {
  DevotionalTranslationUpdateTable(super.table);

  _is.ColumnValue<int, int> devotionalId(int value) => _is.ColumnValue(
    table.devotionalId,
    value,
  );

  _is.ColumnValue<String, String> language(String value) => _is.ColumnValue(
    table.language,
    value,
  );

  _is.ColumnValue<String, String> verseReference(String value) =>
      _is.ColumnValue(
        table.verseReference,
        value,
      );

  _is.ColumnValue<String, String> verseText(String value) => _is.ColumnValue(
    table.verseText,
    value,
  );

  _is.ColumnValue<String, String> thoughtText(String value) => _is.ColumnValue(
    table.thoughtText,
    value,
  );

  _is.ColumnValue<String, String> prayerPrompt(String value) => _is.ColumnValue(
    table.prayerPrompt,
    value,
  );
}

class DevotionalTranslationTable extends _is.Table<int?> {
  DevotionalTranslationTable({super.tableRelation})
    : super(tableName: 'devotional_translations') {
    updateTable = DevotionalTranslationUpdateTable(this);
    devotionalId = _is.ColumnInt(
      'devotionalId',
      this,
    );
    language = _is.ColumnString(
      'language',
      this,
    );
    verseReference = _is.ColumnString(
      'verseReference',
      this,
    );
    verseText = _is.ColumnString(
      'verseText',
      this,
    );
    thoughtText = _is.ColumnString(
      'thoughtText',
      this,
    );
    prayerPrompt = _is.ColumnString(
      'prayerPrompt',
      this,
    );
  }

  late final DevotionalTranslationUpdateTable updateTable;

  late final _is.ColumnInt devotionalId;

  late final _is.ColumnString language;

  late final _is.ColumnString verseReference;

  late final _is.ColumnString verseText;

  late final _is.ColumnString thoughtText;

  late final _is.ColumnString prayerPrompt;

  @override
  List<_is.Column> get columns => [
    id,
    devotionalId,
    language,
    verseReference,
    verseText,
    thoughtText,
    prayerPrompt,
  ];
}

class DevotionalTranslationInclude extends _is.IncludeObject {
  DevotionalTranslationInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => DevotionalTranslation.t;
}

class DevotionalTranslationIncludeList extends _is.IncludeList {
  DevotionalTranslationIncludeList._({
    _is.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DevotionalTranslation.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => DevotionalTranslation.t;
}

class DevotionalTranslationRepository {
  const DevotionalTranslationRepository._();

  /// Returns a list of [DevotionalTranslation]s matching the given query parameters.
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
  Future<List<DevotionalTranslation>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _is.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DevotionalTranslation>(
      where: where?.call(DevotionalTranslation.t),
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [DevotionalTranslation] matching the given query parameters.
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
  Future<DevotionalTranslation?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? offset,
    _is.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _is.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DevotionalTranslation>(
      where: where?.call(DevotionalTranslation.t),
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DevotionalTranslation] by its [id] or null if no such row exists.
  Future<DevotionalTranslation?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<DevotionalTranslation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [DevotionalTranslation]s in the list and returns the inserted rows.
  ///
  /// The returned [DevotionalTranslation]s will have their `id` fields set.
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
  Future<List<DevotionalTranslation>> insert(
    _is.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<DevotionalTranslation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [DevotionalTranslation] and returns the inserted row.
  ///
  /// The returned [DevotionalTranslation] will have its `id` field set.
  Future<DevotionalTranslation> insertRow(
    _is.DatabaseSession session,
    DevotionalTranslation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<DevotionalTranslation>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [DevotionalTranslation]s in the list and returns the resulting rows.
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
  /// The returned [DevotionalTranslation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DevotionalTranslation>> upsert(
    _is.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    required _is.ColumnSelections<DevotionalTranslationTable> conflictColumns,
    _is.ColumnSelections<DevotionalTranslationTable>? updateColumns,
    _is.WhereExpressionBuilder<DevotionalTranslationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<DevotionalTranslation>(
      rows,
      conflictColumns: conflictColumns(DevotionalTranslation.t),
      updateColumns: updateColumns?.call(DevotionalTranslation.t),
      updateWhere: updateWhere?.call(DevotionalTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [DevotionalTranslation] and returns the resulting row.
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
  /// The returned [DevotionalTranslation] will have its `id` field set.
  Future<DevotionalTranslation?> upsertRow(
    _is.DatabaseSession session,
    DevotionalTranslation row, {
    required _is.ColumnSelections<DevotionalTranslationTable> conflictColumns,
    _is.ColumnSelections<DevotionalTranslationTable>? updateColumns,
    _is.WhereExpressionBuilder<DevotionalTranslationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<DevotionalTranslation>(
      row,
      conflictColumns: conflictColumns(DevotionalTranslation.t),
      updateColumns: updateColumns?.call(DevotionalTranslation.t),
      updateWhere: updateWhere?.call(DevotionalTranslation.t),
      transaction: transaction,
    );
  }

  /// Updates all [DevotionalTranslation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DevotionalTranslation>> update(
    _is.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _is.ColumnSelections<DevotionalTranslationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<DevotionalTranslation>(
      rows,
      columns: columns?.call(DevotionalTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [DevotionalTranslation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DevotionalTranslation> updateRow(
    _is.DatabaseSession session,
    DevotionalTranslation row, {
    _is.ColumnSelections<DevotionalTranslationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<DevotionalTranslation>(
      row,
      columns: columns?.call(DevotionalTranslation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DevotionalTranslation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DevotionalTranslation?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<DevotionalTranslationUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<DevotionalTranslation>(
      id,
      columnValues: columnValues(DevotionalTranslation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DevotionalTranslation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<DevotionalTranslation>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<DevotionalTranslationUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<DevotionalTranslationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _is.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<DevotionalTranslation>(
      columnValues: columnValues(DevotionalTranslation.t.updateTable),
      where: where(DevotionalTranslation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [DevotionalTranslation]s in the list and returns the deleted rows.
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
  Future<List<DevotionalTranslation>> delete(
    _is.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _is.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _is.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<DevotionalTranslation>(
      rows,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [DevotionalTranslation].
  Future<DevotionalTranslation> deleteRow(
    _is.DatabaseSession session,
    DevotionalTranslation row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DevotionalTranslation>(
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
  Future<List<DevotionalTranslation>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DevotionalTranslationTable> where,
    _is.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _is.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<DevotionalTranslation>(
      where: where(DevotionalTranslation.t),
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<DevotionalTranslation>(
      where: where?.call(DevotionalTranslation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DevotionalTranslation] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<DevotionalTranslationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DevotionalTranslation>(
      where: where(DevotionalTranslation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
