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

import 'package:serverpod/serverpod.dart' as _i1;

abstract class DownloadAsset
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DownloadAsset._({
    required this.assetKey,
    required this.url,
  });

  factory DownloadAsset({
    required String assetKey,
    required String url,
  }) = _DownloadAssetImpl;

  factory DownloadAsset.fromJson(Map<String, dynamic> jsonSerialization) {
    return DownloadAsset(
      assetKey: jsonSerialization['assetKey'] as String,
      url: jsonSerialization['url'] as String,
    );
  }

  String assetKey;

  String url;

  /// Returns a shallow copy of this [DownloadAsset]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DownloadAsset copyWith({
    String? assetKey,
    String? url,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DownloadAsset',
      'assetKey': assetKey,
      'url': url,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DownloadAsset',
      'assetKey': assetKey,
      'url': url,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DownloadAssetImpl extends DownloadAsset {
  _DownloadAssetImpl({
    required String assetKey,
    required String url,
  }) : super._(
         assetKey: assetKey,
         url: url,
       );

  /// Returns a shallow copy of this [DownloadAsset]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DownloadAsset copyWith({
    String? assetKey,
    String? url,
  }) {
    return DownloadAsset(
      assetKey: assetKey ?? this.assetKey,
      url: url ?? this.url,
    );
  }
}
