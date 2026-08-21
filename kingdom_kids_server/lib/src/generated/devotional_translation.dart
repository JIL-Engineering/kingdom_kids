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
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
    _i1.WhereExpressionBuilder<DevotionalTranslationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    DevotionalTranslationInclude? include,
  }) {
    return DevotionalTranslationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderDescending: orderDescending,
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
  @_i1.useResult
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
    extends _i1.UpdateTable<DevotionalTranslationTable> {
  DevotionalTranslationUpdateTable(super.table);

  _i1.ColumnValue<int, int> devotionalId(int value) => _i1.ColumnValue(
    table.devotionalId,
    value,
  );

  _i1.ColumnValue<String, String> language(String value) => _i1.ColumnValue(
    table.language,
    value,
  );

  _i1.ColumnValue<String, String> verseReference(String value) =>
      _i1.ColumnValue(
        table.verseReference,
        value,
      );

  _i1.ColumnValue<String, String> verseText(String value) => _i1.ColumnValue(
    table.verseText,
    value,
  );

  _i1.ColumnValue<String, String> thoughtText(String value) => _i1.ColumnValue(
    table.thoughtText,
    value,
  );

  _i1.ColumnValue<String, String> prayerPrompt(String value) => _i1.ColumnValue(
    table.prayerPrompt,
    value,
  );
}

class DevotionalTranslationTable extends _i1.Table<int?> {
  DevotionalTranslationTable({super.tableRelation})
    : super(tableName: 'devotional_translations') {
    updateTable = DevotionalTranslationUpdateTable(this);
    devotionalId = _i1.ColumnInt(
      'devotionalId',
      this,
    );
    language = _i1.ColumnString(
      'language',
      this,
    );
    verseReference = _i1.ColumnString(
      'verseReference',
      this,
    );
    verseText = _i1.ColumnString(
      'verseText',
      this,
    );
    thoughtText = _i1.ColumnString(
      'thoughtText',
      this,
    );
    prayerPrompt = _i1.ColumnString(
      'prayerPrompt',
      this,
    );
  }

  late final DevotionalTranslationUpdateTable updateTable;

  late final _i1.ColumnInt devotionalId;

  late final _i1.ColumnString language;

  late final _i1.ColumnString verseReference;

  late final _i1.ColumnString verseText;

  late final _i1.ColumnString thoughtText;

  late final _i1.ColumnString prayerPrompt;

  @override
  List<_i1.Column> get columns => [
    id,
    devotionalId,
    language,
    verseReference,
    verseText,
    thoughtText,
    prayerPrompt,
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
      orderDescending: orderDescending,
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
      orderDescending: orderDescending,
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
  Future<List<DevotionalTranslation>> insert(
    _i1.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<DevotionalTranslation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
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

  /// Updates all [DevotionalTranslation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DevotionalTranslation>> update(
    _i1.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _i1.ColumnSelections<DevotionalTranslationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DevotionalTranslation>(
      rows,
      columns: columns?.call(DevotionalTranslation.t),
      transaction: transaction,
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
  Future<List<DevotionalTranslation>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DevotionalTranslationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<DevotionalTranslationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTranslationTable>? orderBy,
    _i1.OrderByListBuilder<DevotionalTranslationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DevotionalTranslation>(
      columnValues: columnValues(DevotionalTranslation.t.updateTable),
      where: where(DevotionalTranslation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DevotionalTranslation.t),
      orderByList: orderByList?.call(DevotionalTranslation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DevotionalTranslation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DevotionalTranslation>> delete(
    _i1.DatabaseSession session,
    List<DevotionalTranslation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DevotionalTranslation>(
      rows,
      transaction: transaction,
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
  Future<List<DevotionalTranslation>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DevotionalTranslationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DevotionalTranslation>(
      where: where(DevotionalTranslation.t),
      transaction: transaction,
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
