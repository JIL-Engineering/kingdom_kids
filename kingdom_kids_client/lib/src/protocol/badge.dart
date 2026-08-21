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
import 'package:kingdom_kids_client/src/protocol/protocol.dart' as _i2;

abstract class Badge implements _i1.SerializableModel {
  Badge._({
    this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.icon_asset,
    required this.trigger_rule,
  });

  factory Badge({
    int? id,
    required String code,
    required String name,
    required String description,
    required String icon_asset,
    required Map<String, dynamic> trigger_rule,
  }) = _BadgeImpl;

  factory Badge.fromJson(Map<String, dynamic> jsonSerialization) {
    return Badge(
      id: jsonSerialization['id'] as int?,
      code: jsonSerialization['code'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      icon_asset: jsonSerialization['icon_asset'] as String,
      trigger_rule: _i2.Protocol().deserialize<Map<String, dynamic>>(
        jsonSerialization['trigger_rule'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String code;

  String name;

  String description;

  String icon_asset;

  Map<String, dynamic> trigger_rule;

  /// Returns a shallow copy of this [Badge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Badge copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    String? icon_asset,
    Map<String, dynamic>? trigger_rule,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Badge',
      if (id != null) 'id': id,
      'code': code,
      'name': name,
      'description': description,
      'icon_asset': icon_asset,
      'trigger_rule': trigger_rule.toJson(
        valueToJson: (v) => _i2.Protocol().dynamicFieldToJson(v),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BadgeImpl extends Badge {
  _BadgeImpl({
    int? id,
    required String code,
    required String name,
    required String description,
    required String icon_asset,
    required Map<String, dynamic> trigger_rule,
  }) : super._(
         id: id,
         code: code,
         name: name,
         description: description,
         icon_asset: icon_asset,
         trigger_rule: trigger_rule,
       );

  /// Returns a shallow copy of this [Badge]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Badge copyWith({
    Object? id = _Undefined,
    String? code,
    String? name,
    String? description,
    String? icon_asset,
    Map<String, dynamic>? trigger_rule,
  }) {
    return Badge(
      id: id is int? ? id : this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      icon_asset: icon_asset ?? this.icon_asset,
      trigger_rule:
          trigger_rule ??
          this.trigger_rule.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
    );
  }
}
