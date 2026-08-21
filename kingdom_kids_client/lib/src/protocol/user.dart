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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.email,
    required this.password_hash,
    this.country,
    required this.timezone,
    required this.preferred_language,
    this.consent_given_at,
    required this.created_at,
  });

  factory User({
    int? id,
    required String email,
    required String password_hash,
    String? country,
    required String timezone,
    required String preferred_language,
    DateTime? consent_given_at,
    required DateTime created_at,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      password_hash: jsonSerialization['password_hash'] as String,
      country: jsonSerialization['country'] as String?,
      timezone: jsonSerialization['timezone'] as String,
      preferred_language: jsonSerialization['preferred_language'] as String,
      consent_given_at: jsonSerialization['consent_given_at'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['consent_given_at'],
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

  String email;

  String password_hash;

  String? country;

  String timezone;

  String preferred_language;

  DateTime? consent_given_at;

  DateTime created_at;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? email,
    String? password_hash,
    String? country,
    String? timezone,
    String? preferred_language,
    DateTime? consent_given_at,
    DateTime? created_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'email': email,
      'password_hash': password_hash,
      if (country != null) 'country': country,
      'timezone': timezone,
      'preferred_language': preferred_language,
      if (consent_given_at != null)
        'consent_given_at': consent_given_at?.toJson(),
      'created_at': created_at.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String email,
    required String password_hash,
    String? country,
    required String timezone,
    required String preferred_language,
    DateTime? consent_given_at,
    required DateTime created_at,
  }) : super._(
         id: id,
         email: email,
         password_hash: password_hash,
         country: country,
         timezone: timezone,
         preferred_language: preferred_language,
         consent_given_at: consent_given_at,
         created_at: created_at,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? email,
    String? password_hash,
    Object? country = _Undefined,
    String? timezone,
    String? preferred_language,
    Object? consent_given_at = _Undefined,
    DateTime? created_at,
  }) {
    return User(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      password_hash: password_hash ?? this.password_hash,
      country: country is String? ? country : this.country,
      timezone: timezone ?? this.timezone,
      preferred_language: preferred_language ?? this.preferred_language,
      consent_given_at: consent_given_at is DateTime?
          ? consent_given_at
          : this.consent_given_at,
      created_at: created_at ?? this.created_at,
    );
  }
}
