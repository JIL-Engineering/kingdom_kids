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

abstract class BookPage
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  BookPage._({
    required this.pageNumber,
    required this.illustrationAsset,
    required this.layoutType,
    required this.text,
    required this.audioAsset,
  });

  factory BookPage({
    required int pageNumber,
    required String illustrationAsset,
    required String layoutType,
    required String text,
    required String audioAsset,
  }) = _BookPageImpl;

  factory BookPage.fromJson(Map<String, dynamic> jsonSerialization) {
    return BookPage(
      pageNumber: jsonSerialization['pageNumber'] as int,
      illustrationAsset: jsonSerialization['illustrationAsset'] as String,
      layoutType: jsonSerialization['layoutType'] as String,
      text: jsonSerialization['text'] as String,
      audioAsset: jsonSerialization['audioAsset'] as String,
    );
  }

  int pageNumber;

  String illustrationAsset;

  String layoutType;

  String text;

  String audioAsset;

  /// Returns a shallow copy of this [BookPage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BookPage copyWith({
    int? pageNumber,
    String? illustrationAsset,
    String? layoutType,
    String? text,
    String? audioAsset,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BookPage',
      'pageNumber': pageNumber,
      'illustrationAsset': illustrationAsset,
      'layoutType': layoutType,
      'text': text,
      'audioAsset': audioAsset,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BookPage',
      'pageNumber': pageNumber,
      'illustrationAsset': illustrationAsset,
      'layoutType': layoutType,
      'text': text,
      'audioAsset': audioAsset,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _BookPageImpl extends BookPage {
  _BookPageImpl({
    required int pageNumber,
    required String illustrationAsset,
    required String layoutType,
    required String text,
    required String audioAsset,
  }) : super._(
         pageNumber: pageNumber,
         illustrationAsset: illustrationAsset,
         layoutType: layoutType,
         text: text,
         audioAsset: audioAsset,
       );

  /// Returns a shallow copy of this [BookPage]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BookPage copyWith({
    int? pageNumber,
    String? illustrationAsset,
    String? layoutType,
    String? text,
    String? audioAsset,
  }) {
    return BookPage(
      pageNumber: pageNumber ?? this.pageNumber,
      illustrationAsset: illustrationAsset ?? this.illustrationAsset,
      layoutType: layoutType ?? this.layoutType,
      text: text ?? this.text,
      audioAsset: audioAsset ?? this.audioAsset,
    );
  }
}
