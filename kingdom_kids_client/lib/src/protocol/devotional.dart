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
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Devotional implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime date;

  String? category;

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
