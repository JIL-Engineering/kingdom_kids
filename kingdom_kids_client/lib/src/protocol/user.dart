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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class User
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  User._({
    this.id,
    required this.email,
    required this.passwordHash,
    this.country,
    required this.timezone,
    required this.preferredLanguage,
    this.consentGivenAt,
    required this.createdAt,
  });

  factory User({
    int? id,
    required String email,
    required String passwordHash,
    String? country,
    required String timezone,
    required String preferredLanguage,
    DateTime? consentGivenAt,
    required DateTime createdAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      country: jsonSerialization['country'] as String?,
      timezone: jsonSerialization['timezone'] as String,
      preferredLanguage: jsonSerialization['preferredLanguage'] as String,
      consentGivenAt: jsonSerialization['consentGivenAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['consentGivenAt'],
            ),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String passwordHash;

  String? country;

  String timezone;

  String preferredLanguage;

  DateTime? consentGivenAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  User copyWith({
    int? id,
    String? email,
    String? passwordHash,
    String? country,
    String? timezone,
    String? preferredLanguage,
    DateTime? consentGivenAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'email': email,
      'passwordHash': passwordHash,
      if (country != null) 'country': country,
      'timezone': timezone,
      'preferredLanguage': preferredLanguage,
      if (consentGivenAt != null) 'consentGivenAt': consentGivenAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'email': email,
      'passwordHash': passwordHash,
      if (country != null) 'country': country,
      'timezone': timezone,
      'preferredLanguage': preferredLanguage,
      if (consentGivenAt != null) 'consentGivenAt': consentGivenAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String email,
    required String passwordHash,
    String? country,
    required String timezone,
    required String preferredLanguage,
    DateTime? consentGivenAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         email: email,
         passwordHash: passwordHash,
         country: country,
         timezone: timezone,
         preferredLanguage: preferredLanguage,
         consentGivenAt: consentGivenAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? email,
    String? passwordHash,
    Object? country = _Undefined,
    String? timezone,
    String? preferredLanguage,
    Object? consentGivenAt = _Undefined,
    DateTime? createdAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      country: country is String? ? country : this.country,
      timezone: timezone ?? this.timezone,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      consentGivenAt: consentGivenAt is DateTime?
          ? consentGivenAt
          : this.consentGivenAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
