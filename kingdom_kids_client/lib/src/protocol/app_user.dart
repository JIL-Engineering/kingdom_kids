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
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i2;
import 'package:kingdom_kids_client/src/protocol/protocol.dart' as _i3;

abstract class AppUser implements _i1.SerializableModel {
  AppUser._({
    this.id,
    required this.authUserId,
    this.authUser,
    this.country,
    required this.timezone,
    required this.preferredLanguage,
    this.consentGivenAt,
    required this.createdAt,
  });

  factory AppUser({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    String? country,
    required String timezone,
    required String preferredLanguage,
    DateTime? consentGivenAt,
    required DateTime createdAt,
  }) = _AppUserImpl;

  factory AppUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppUser(
      id: jsonSerialization['id'] as int?,
      authUserId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['authUserId'],
      ),
      authUser: jsonSerialization['authUser'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(
              jsonSerialization['authUser'],
            ),
      country: jsonSerialization['country'] as String?,
      timezone: jsonSerialization['timezone'] as String,
      preferredLanguage: jsonSerialization['preferredLanguage'] as String,
      consentGivenAt: jsonSerialization['consentGivenAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['consentGivenAt'],
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

  _i1.UuidValue authUserId;

  _i2.AuthUser? authUser;

  String? country;

  String timezone;

  String preferredLanguage;

  DateTime? consentGivenAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [AppUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppUser copyWith({
    int? id,
    _i1.UuidValue? authUserId,
    _i2.AuthUser? authUser,
    String? country,
    String? timezone,
    String? preferredLanguage,
    DateTime? consentGivenAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppUser',
      if (id != null) 'id': id,
      'authUserId': authUserId.toJson(),
      if (authUser != null) 'authUser': authUser?.toJson(),
      if (country != null) 'country': country,
      'timezone': timezone,
      'preferredLanguage': preferredLanguage,
      if (consentGivenAt != null) 'consentGivenAt': consentGivenAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppUserImpl extends AppUser {
  _AppUserImpl({
    int? id,
    required _i1.UuidValue authUserId,
    _i2.AuthUser? authUser,
    String? country,
    required String timezone,
    required String preferredLanguage,
    DateTime? consentGivenAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         authUserId: authUserId,
         authUser: authUser,
         country: country,
         timezone: timezone,
         preferredLanguage: preferredLanguage,
         consentGivenAt: consentGivenAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AppUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppUser copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? authUserId,
    Object? authUser = _Undefined,
    Object? country = _Undefined,
    String? timezone,
    String? preferredLanguage,
    Object? consentGivenAt = _Undefined,
    DateTime? createdAt,
  }) {
    return AppUser(
      id: id is int? ? id : this.id,
      authUserId: authUserId ?? this.authUserId,
      authUser: authUser is _i2.AuthUser?
          ? authUser
          : this.authUser?.copyWith(),
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
