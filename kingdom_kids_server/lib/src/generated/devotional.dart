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

abstract class Devotional
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Devotional._({
    this.id,
    required this.date,
    this.category,
  });

  factory Devotional({
    int? id,
    required DateTime date,
    String? category,
  }) = _DevotionalImpl;

  factory Devotional.fromJson(Map<String, dynamic> jsonSerialization) {
    return Devotional(
      id: jsonSerialization['id'] as int?,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      category: jsonSerialization['category'] as String?,
    );
  }

  static final t = DevotionalTable();

  static const db = DevotionalRepository._();

  @override
  int? id;

  DateTime date;

  String? category;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Devotional]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Devotional copyWith({
    int? id,
    DateTime? date,
    String? category,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Devotional',
      if (id != null) 'id': id,
      'date': date.toJson(),
      if (category != null) 'category': category,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Devotional',
      if (id != null) 'id': id,
      'date': date.toJson(),
      if (category != null) 'category': category,
    };
  }

  static DevotionalInclude include() {
    return DevotionalInclude._();
  }

  static DevotionalIncludeList includeList({
    _i1.WhereExpressionBuilder<DevotionalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTable>? orderByList,
    DevotionalInclude? include,
  }) {
    return DevotionalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Devotional.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Devotional.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DevotionalImpl extends Devotional {
  _DevotionalImpl({
    int? id,
    required DateTime date,
    String? category,
  }) : super._(
         id: id,
         date: date,
         category: category,
       );

  /// Returns a shallow copy of this [Devotional]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Devotional copyWith({
    Object? id = _Undefined,
    DateTime? date,
    Object? category = _Undefined,
  }) {
    return Devotional(
      id: id is int? ? id : this.id,
      date: date ?? this.date,
      category: category is String? ? category : this.category,
    );
  }
}

class DevotionalUpdateTable extends _i1.UpdateTable<DevotionalTable> {
  DevotionalUpdateTable(super.table);

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<String, String> category(String? value) => _i1.ColumnValue(
    table.category,
    value,
  );
}

class DevotionalTable extends _i1.Table<int?> {
  DevotionalTable({super.tableRelation}) : super(tableName: 'devotionals') {
    updateTable = DevotionalUpdateTable(this);
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
  }

  late final DevotionalUpdateTable updateTable;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString category;

  @override
  List<_i1.Column> get columns => [
    id,
    date,
    category,
  ];
}

class DevotionalInclude extends _i1.IncludeObject {
  DevotionalInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Devotional.t;
}

class DevotionalIncludeList extends _i1.IncludeList {
  DevotionalIncludeList._({
    _i1.WhereExpressionBuilder<DevotionalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Devotional.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Devotional.t;
}

class DevotionalRepository {
  const DevotionalRepository._();

  /// Returns a list of [Devotional]s matching the given query parameters.
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
  Future<List<Devotional>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DevotionalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Devotional>(
      where: where?.call(Devotional.t),
      orderBy: orderBy?.call(Devotional.t),
      orderByList: orderByList?.call(Devotional.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Devotional] matching the given query parameters.
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
  Future<Devotional?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DevotionalTable>? where,
    int? offset,
    _i1.OrderByBuilder<DevotionalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DevotionalTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Devotional>(
      where: where?.call(Devotional.t),
      orderBy: orderBy?.call(Devotional.t),
      orderByList: orderByList?.call(Devotional.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Devotional] by its [id] or null if no such row exists.
  Future<Devotional?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Devotional>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Devotional]s in the list and returns the inserted rows.
  ///
  /// The returned [Devotional]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Devotional>> insert(
    _i1.DatabaseSession session,
    List<Devotional> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Devotional>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Devotional] and returns the inserted row.
  ///
  /// The returned [Devotional] will have its `id` field set.
  Future<Devotional> insertRow(
    _i1.DatabaseSession session,
    Devotional row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Devotional>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Devotional]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Devotional>> update(
    _i1.DatabaseSession session,
    List<Devotional> rows, {
    _i1.ColumnSelections<DevotionalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Devotional>(
      rows,
      columns: columns?.call(Devotional.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Devotional]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Devotional> updateRow(
    _i1.DatabaseSession session,
    Devotional row, {
    _i1.ColumnSelections<DevotionalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Devotional>(
      row,
      columns: columns?.call(Devotional.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Devotional] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Devotional?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<DevotionalUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Devotional>(
      id,
      columnValues: columnValues(Devotional.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Devotional]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Devotional>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<DevotionalUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<DevotionalTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DevotionalTable>? orderBy,
    _i1.OrderByListBuilder<DevotionalTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Devotional>(
      columnValues: columnValues(Devotional.t.updateTable),
      where: where(Devotional.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Devotional.t),
      orderByList: orderByList?.call(Devotional.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Devotional]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Devotional>> delete(
    _i1.DatabaseSession session,
    List<Devotional> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Devotional>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Devotional].
  Future<Devotional> deleteRow(
    _i1.DatabaseSession session,
    Devotional row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Devotional>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Devotional>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DevotionalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Devotional>(
      where: where(Devotional.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<DevotionalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Devotional>(
      where: where?.call(Devotional.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Devotional] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<DevotionalTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Devotional>(
      where: where(Devotional.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
