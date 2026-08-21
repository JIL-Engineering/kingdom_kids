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

abstract class ChildBadge implements _i1.SerializableModel {
  ChildBadge._({
    this.id,
    required this.child_id,
    required this.badge_id,
    required this.earned_at,
  });

  factory ChildBadge({
    int? id,
    required int child_id,
    required int badge_id,
    required DateTime earned_at,
  }) = _ChildBadgeImpl;

  factory ChildBadge.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChildBadge(
      id: jsonSerialization['id'] as int?,
      child_id: jsonSerialization['child_id'] as int,
      badge_id: jsonSerialization['badge_id'] as int,
      earned_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['earned_at'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int child_id;

  int badge_id;

  DateTime earned_at;

  /// Returns a shallow copy of this [ChildBadge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChildBadge copyWith({
    int? id,
    int? child_id,
    int? badge_id,
    DateTime? earned_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChildBadge',
      if (id != null) 'id': id,
      'child_id': child_id,
      'badge_id': badge_id,
      'earned_at': earned_at.toJson(),
    };
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
    required int child_id,
    required int badge_id,
    required DateTime earned_at,
  }) : super._(
         id: id,
         child_id: child_id,
         badge_id: badge_id,
         earned_at: earned_at,
       );

  /// Returns a shallow copy of this [ChildBadge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChildBadge copyWith({
    Object? id = _Undefined,
    int? child_id,
    int? badge_id,
    DateTime? earned_at,
  }) {
    return ChildBadge(
      id: id is int? ? id : this.id,
      child_id: child_id ?? this.child_id,
      badge_id: badge_id ?? this.badge_id,
      earned_at: earned_at ?? this.earned_at,
    );
  }
}
