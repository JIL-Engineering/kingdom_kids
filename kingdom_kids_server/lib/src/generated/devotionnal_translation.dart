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

abstract class DevotionalTranslation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DevotionalTranslation._({
    this.id,
    required this.devotional_id,
    required this.language,
    required this.verse_reference,
    required this.verse_text,
    required this.thought_text,
    required this.prayer_prompt,
  });

  factory DevotionalTranslation({
    int? id,
    required int devotional_id,
    required String language,
    required String verse_reference,
    required String verse_text,
    required String thought_text,
    required String prayer_prompt,
  }) = _DevotionalTranslationImpl;

  factory DevotionalTranslation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DevotionalTranslation(
      id: jsonSerialization['id'] as int?,
      devotional_id: jsonSerialization['devotional_id'] as int,
      language: jsonSerialization['language'] as String,
      verse_reference: jsonSerialization['verse_reference'] as String,
      verse_text: jsonSerialization['verse_text'] as String,
      thought_text: jsonSerialization['thought_text'] as String,
      prayer_prompt: jsonSerialization['prayer_prompt'] as String,
    );
  }

  static final t = DevotionalTranslationTable();

  static const db = DevotionalTranslationRepository._();

  @override
  int? id;

  int devotional_id;

  String language;

  String verse_reference;

  String verse_text;

  String thought_text;

  String prayer_prompt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DevotionalTranslation copyWith({
    int? id,
    int? devotional_id,
    String? language,
    String? verse_reference,
    String? verse_text,
    String? thought_text,
    String? prayer_prompt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DevotionalTranslation',
      if (id != null) 'id': id,
      'devotional_id': devotional_id,
      'language': language,
      'verse_reference': verse_reference,
      'verse_text': verse_text,
      'thought_text': thought_text,
      'prayer_prompt': prayer_prompt,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DevotionalTranslation',
      if (id != null) 'id': id,
      'devotional_id': devotional_id,
      'language': language,
      'verse_reference': verse_reference,
      'verse_text': verse_text,
      'thought_text': thought_text,
      'prayer_prompt': prayer_prompt,
    };
  }

  static DevotionalTranslationInclude include() {
    return DevotionalTranslationInclude._();
  }

  static DevotionalTranslationIncludeList includeList({
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    DevotionalTranslationInclude? include,
  }) {
    return DevotionalTranslationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(DevotionalTranslation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DevotionalTranslationImpl extends DevotionalTranslation {
  _DevotionalTranslationImpl({
    int? id,
    required int devotional_id,
    required String language,
    required String verse_reference,
    required String verse_text,
    required String thought_text,
    required String prayer_prompt,
  }) : super._(
         id: id,
         devotional_id: devotional_id,
         language: language,
         verse_reference: verse_reference,
         verse_text: verse_text,
         thought_text: thought_text,
         prayer_prompt: prayer_prompt,
       );

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DevotionalTranslation copyWith({
    Object? id = _Undefined,
    int? devotional_id,
    String? language,
    String? verse_reference,
    String? verse_text,
    String? thought_text,
    String? prayer_prompt,
  }) {
    return DevotionalTranslation(
      id: id is int? ? id : this.id,
      devotional_id: devotional_id ?? this.devotional_id,
      language: language ?? this.language,
      verse_reference: verse_reference ?? this.verse_reference,
      verse_text: verse_text ?? this.verse_text,
      thought_text: thought_text ?? this.thought_text,
      prayer_prompt: prayer_prompt ?? this.prayer_prompt,
    );
  }
}

class DevotionalTranslationUpdateTable
    extends _i1.UpdateTable<DevotionalTranslationTable> {
  DevotionalTranslationUpdateTable(super.table);

  _i1.ColumnValue<int, int> devotional_id(int value) => _i1.ColumnValue(
    table.devotional_id,
    value,
  );

  _i1.ColumnValue<String, String> language(String value) => _i1.ColumnValue(
    table.language,
    value,
  );

  _i1.ColumnValue<String, String> verse_reference(String value) =>
      _i1.ColumnValue(
        table.verse_reference,
        value,
      );

  _i1.ColumnValue<String, String> verse_text(String value) => _i1.ColumnValue(
    table.verse_text,
    value,
  );

  _i1.ColumnValue<String, String> thought_text(String value) => _i1.ColumnValue(
    table.thought_text,
    value,
  );

  _i1.ColumnValue<String, String> prayer_prompt(String value) =>
      _i1.ColumnValue(
        table.prayer_prompt,
        value,
      );
}

class DevotionalTranslationTable extends _i1.Table<int?> {
  DevotionalTranslationTable({super.tableRelation})
    : super(tableName: 'devotional_translation') {
    updateTable = DevotionalTranslationUpdateTable(this);
    devotional_id = _i1.ColumnInt(
      'devotional_id',
      this,
    );
    language = _i1.ColumnString(
      'language',
      this,
    );
    verse_reference = _i1.ColumnString(
      'verse_reference',
      this,
    );
    verse_text = _i1.ColumnString(
      'verse_text',
      this,
    );
    thought_text = _i1.ColumnString(
      'thought_text',
      this,
    );
    prayer_prompt = _i1.ColumnString(
      'prayer_prompt',
      this,
    );
  }

  late final DevotionalTranslationUpdateTable updateTable;

  late final _i1.ColumnInt devotional_id;

  late final _i1.ColumnString language;

  late final _i1.ColumnString verse_reference;

  late final _i1.ColumnString verse_text;

  late final _i1.ColumnString thought_text;

  late final _i1.ColumnString prayer_prompt;

  @override
  List<_i1.Column> get columns => [
    id,
    devotional_id,
    language,
    verse_reference,
    verse_text,
    thought_text,
    prayer_prompt,
  ];
}

class DevotionalTranslationInclude extends _i1.IncludeObject {
  DevotionalTranslationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DevotionalTranslation.t;
}

class DevotionalTranslationIncludeList extends _i1.IncludeList {
  DevotionalTranslationIncludeList._({
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DevotionalTranslation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DevotionalTranslation.t;
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<DevotionalTranslation>(
      where: where?.call(DevotionalTranslation.t),
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? offset,
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<DevotionalTranslation>(
      where: where?.call(DevotionalTranslation.t),
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [DevotionalTranslation] by its [id] or null if no such row exists.
  Future<DevotionalTranslation?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
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
    _i1.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    DevotionalTranslation row, {
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    required _i1.ColumnSelections<DevotionalTranslationTable> conflictColumns,
    _i1.ColumnSelections<DevotionalTranslationTable>? updateColumns,
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? updateWhere,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    DevotionalTranslation row, {
    required _i1.ColumnSelections<DevotionalTranslationTable> conflictColumns,
    _i1.ColumnSelections<DevotionalTranslationTable>? updateColumns,
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? updateWhere,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _i1.ColumnSelections<DevotionalTranslationTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    DevotionalTranslation row, {
    _i1.ColumnSelections<DevotionalTranslationTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<DevotionalTranslationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DevotionalTranslationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<DevotionalTranslationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<DevotionalTranslation>(
      columnValues: columnValues(DevotionalTranslation.t.updateTable),
      where: where(DevotionalTranslation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
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
    _i1.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<DevotionalTranslation>(
      rows,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [DevotionalTranslation].
  Future<DevotionalTranslation> deleteRow(
    _i1.DatabaseSession session,
    DevotionalTranslation row, {
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DevotionalTranslationTable> where,
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<DevotionalTranslation>(
      where: where(DevotionalTranslation.t),
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
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
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DevotionalTranslation>(
      where: where?.call(DevotionalTranslation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [DevotionalTranslation] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DevotionalTranslationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<DevotionalTranslation>(
      where: where(DevotionalTranslation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
