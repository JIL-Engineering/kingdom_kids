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

abstract class Page implements _i1.SerializableModel {
  Page._({
    this.id,
    required this.book_id,
    required this.page_number,
    required this.illustration_asset,
    required this.layout_type,
  });

  factory Page({
    int? id,
    required int book_id,
    required int page_number,
    required String illustration_asset,
    required String layout_type,
  }) = _PageImpl;

  factory Page.fromJson(Map<String, dynamic> jsonSerialization) {
    return Page(
      id: jsonSerialization['id'] as int?,
      book_id: jsonSerialization['book_id'] as int,
      page_number: jsonSerialization['page_number'] as int,
      illustration_asset: jsonSerialization['illustration_asset'] as String,
      layout_type: jsonSerialization['layout_type'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int book_id;

  int page_number;

  String illustration_asset;

  String layout_type;

  /// Returns a shallow copy of this [Page]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Page copyWith({
    int? id,
    int? book_id,
    int? page_number,
    String? illustration_asset,
    String? layout_type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Page',
      if (id != null) 'id': id,
      'book_id': book_id,
      'page_number': page_number,
      'illustration_asset': illustration_asset,
      'layout_type': layout_type,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PageImpl extends Page {
  _PageImpl({
    int? id,
    required int book_id,
    required int page_number,
    required String illustration_asset,
    required String layout_type,
  }) : super._(
         id: id,
         book_id: book_id,
         page_number: page_number,
         illustration_asset: illustration_asset,
         layout_type: layout_type,
       );

  /// Returns a shallow copy of this [Page]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Page copyWith({
    Object? id = _Undefined,
    int? book_id,
    int? page_number,
    String? illustration_asset,
    String? layout_type,
  }) {
    return Page(
      id: id is int? ? id : this.id,
      book_id: book_id ?? this.book_id,
      page_number: page_number ?? this.page_number,
      illustration_asset: illustration_asset ?? this.illustration_asset,
      layout_type: layout_type ?? this.layout_type,
    );
  }
}
