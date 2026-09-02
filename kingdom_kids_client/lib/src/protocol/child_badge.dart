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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int childId;

  int badgeId;

  DateTime earnedAt;

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
