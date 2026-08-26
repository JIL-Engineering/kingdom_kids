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

abstract class Badge
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Badge._({
    this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.iconAsset,
    required this.triggerRule,
  });

  factory Badge({
    int? id,
    required String code,
    required String name,
    required String description,
    required String iconAsset,
    required String triggerRule,
  }) = _BadgeImpl;

  factory Badge.fromJson(Map<String, dynamic> jsonSerialization) {
    return Badge(
      id: jsonSerialization['id'] as int?,
      code: jsonSerialization['code'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      iconAsset: jsonSerialization['iconAsset'] as String,
      triggerRule: jsonSerialization['triggerRule'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String code;

  String name;

  String description;

  String iconAsset;

  String triggerRule;

  /// Returns a shallow copy of this [Badge]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Badge copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    String? iconAsset,
    String? triggerRule,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Badge',
      if (id != null) 'id': id,
      'code': code,
      'name': name,
      'description': description,
      'iconAsset': iconAsset,
      'triggerRule': triggerRule,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Badge',
      if (id != null) 'id': id,
      'code': code,
      'name': name,
      'description': description,
      'iconAsset': iconAsset,
      'triggerRule': triggerRule,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BadgeImpl extends Badge {
  _BadgeImpl({
    int? id,
    required String code,
    required String name,
    required String description,
    required String iconAsset,
    required String triggerRule,
  }) : super._(
         id: id,
         code: code,
         name: name,
         description: description,
         iconAsset: iconAsset,
         triggerRule: triggerRule,
       );

  /// Returns a shallow copy of this [Badge]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Badge copyWith({
    Object? id = _Undefined,
    String? code,
    String? name,
    String? description,
    String? iconAsset,
    String? triggerRule,
  }) {
    return Badge(
      id: id is int? ? id : this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      iconAsset: iconAsset ?? this.iconAsset,
      triggerRule: triggerRule ?? this.triggerRule,
    );
  }
}
