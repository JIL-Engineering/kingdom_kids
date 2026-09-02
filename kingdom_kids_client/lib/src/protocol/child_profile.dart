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

abstract class ChildProfile implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int parentId;

  String displayName;

  int birthYear;

  String ageBracket;

  String preferredLanguage;

  String avatarId;

  bool pinProtected;

  DateTime createdAt;

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
