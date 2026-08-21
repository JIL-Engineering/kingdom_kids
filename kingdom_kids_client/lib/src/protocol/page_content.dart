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

abstract class PageContent implements _i1.SerializableModel {
  PageContent._({
    this.id,
    required this.pageId,
    required this.language,
    required this.text,
    required this.audioAsset,
  });

  factory PageContent({
    int? id,
    required int pageId,
    required String language,
    required String text,
    required String audioAsset,
  }) = _PageContentImpl;

  factory PageContent.fromJson(Map<String, dynamic> jsonSerialization) {
    return PageContent(
      id: jsonSerialization['id'] as int?,
      pageId: jsonSerialization['pageId'] as int,
      language: jsonSerialization['language'] as String,
      text: jsonSerialization['text'] as String,
      audioAsset: jsonSerialization['audioAsset'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pageId;

  String language;

  String text;

  String audioAsset;

  /// Returns a shallow copy of this [PageContent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PageContent copyWith({
    int? id,
    int? pageId,
    String? language,
    String? text,
    String? audioAsset,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PageContent',
      if (id != null) 'id': id,
      'pageId': pageId,
      'language': language,
      'text': text,
      'audioAsset': audioAsset,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PageContentImpl extends PageContent {
  _PageContentImpl({
    int? id,
    required int pageId,
    required String language,
    required String text,
    required String audioAsset,
  }) : super._(
         id: id,
         pageId: pageId,
         language: language,
         text: text,
         audioAsset: audioAsset,
       );

  /// Returns a shallow copy of this [PageContent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PageContent copyWith({
    Object? id = _Undefined,
    int? pageId,
    String? language,
    String? text,
    String? audioAsset,
  }) {
    return PageContent(
      id: id is int? ? id : this.id,
      pageId: pageId ?? this.pageId,
      language: language ?? this.language,
      text: text ?? this.text,
      audioAsset: audioAsset ?? this.audioAsset,
    );
  }
}
