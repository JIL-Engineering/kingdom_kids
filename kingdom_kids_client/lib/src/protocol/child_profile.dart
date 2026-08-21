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
    required this.parent_id,
    required this.display_name,
    required this.birth_year,
    required this.age_bracket,
    required this.preferred_language,
    required this.avatar_id,
    required this.pin_protected,
    required this.created_at,
  });

  factory ChildProfile({
    int? id,
    required int parent_id,
    required String display_name,
    required int birth_year,
    required String age_bracket,
    required String preferred_language,
    required String avatar_id,
    required bool pin_protected,
    required DateTime created_at,
  }) = _ChildProfileImpl;

  factory ChildProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChildProfile(
      id: jsonSerialization['id'] as int?,
      parent_id: jsonSerialization['parent_id'] as int,
      display_name: jsonSerialization['display_name'] as String,
      birth_year: jsonSerialization['birth_year'] as int,
      age_bracket: jsonSerialization['age_bracket'] as String,
      preferred_language: jsonSerialization['preferred_language'] as String,
      avatar_id: jsonSerialization['avatar_id'] as String,
      pin_protected: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['pin_protected'],
      ),
      created_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['created_at'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int parent_id;

  String display_name;

  int birth_year;

  String age_bracket;

  String preferred_language;

  String avatar_id;

  bool pin_protected;

  DateTime created_at;

  /// Returns a shallow copy of this [ChildProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChildProfile copyWith({
    int? id,
    int? parent_id,
    String? display_name,
    int? birth_year,
    String? age_bracket,
    String? preferred_language,
    String? avatar_id,
    bool? pin_protected,
    DateTime? created_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ChildProfile',
      if (id != null) 'id': id,
      'parent_id': parent_id,
      'display_name': display_name,
      'birth_year': birth_year,
      'age_bracket': age_bracket,
      'preferred_language': preferred_language,
      'avatar_id': avatar_id,
      'pin_protected': pin_protected,
      'created_at': created_at.toJson(),
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
    required int parent_id,
    required String display_name,
    required int birth_year,
    required String age_bracket,
    required String preferred_language,
    required String avatar_id,
    required bool pin_protected,
    required DateTime created_at,
  }) : super._(
         id: id,
         parent_id: parent_id,
         display_name: display_name,
         birth_year: birth_year,
         age_bracket: age_bracket,
         preferred_language: preferred_language,
         avatar_id: avatar_id,
         pin_protected: pin_protected,
         created_at: created_at,
       );

  /// Returns a shallow copy of this [ChildProfile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChildProfile copyWith({
    Object? id = _Undefined,
    int? parent_id,
    String? display_name,
    int? birth_year,
    String? age_bracket,
    String? preferred_language,
    String? avatar_id,
    bool? pin_protected,
    DateTime? created_at,
  }) {
    return ChildProfile(
      id: id is int? ? id : this.id,
      parent_id: parent_id ?? this.parent_id,
      display_name: display_name ?? this.display_name,
      birth_year: birth_year ?? this.birth_year,
      age_bracket: age_bracket ?? this.age_bracket,
      preferred_language: preferred_language ?? this.preferred_language,
      avatar_id: avatar_id ?? this.avatar_id,
      pin_protected: pin_protected ?? this.pin_protected,
      created_at: created_at ?? this.created_at,
    );
  }
}
