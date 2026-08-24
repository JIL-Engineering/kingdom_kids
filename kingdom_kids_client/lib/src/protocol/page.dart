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
    required this.bookId,
    required this.pageNumber,
    required this.illustrationAsset,
    required this.layoutType,
  });

  factory Page({
    int? id,
    required int bookId,
    required int pageNumber,
    required String illustrationAsset,
    required String layoutType,
  }) = _PageImpl;

  factory Page.fromJson(Map<String, dynamic> jsonSerialization) {
    return Page(
      id: jsonSerialization['id'] as int?,
      bookId: jsonSerialization['bookId'] as int,
      pageNumber: jsonSerialization['pageNumber'] as int,
      illustrationAsset: jsonSerialization['illustrationAsset'] as String,
      layoutType: jsonSerialization['layoutType'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int bookId;

  int pageNumber;

  String illustrationAsset;

  String layoutType;

  /// Returns a shallow copy of this [Page]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Page copyWith({
    int? id,
    int? bookId,
    int? pageNumber,
    String? illustrationAsset,
    String? layoutType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Page',
      if (id != null) 'id': id,
      'bookId': bookId,
      'pageNumber': pageNumber,
      'illustrationAsset': illustrationAsset,
      'layoutType': layoutType,
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
    required int bookId,
    required int pageNumber,
    required String illustrationAsset,
    required String layoutType,
  }) : super._(
         id: id,
         bookId: bookId,
         pageNumber: pageNumber,
         illustrationAsset: illustrationAsset,
         layoutType: layoutType,
       );

  /// Returns a shallow copy of this [Page]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Page copyWith({
    Object? id = _Undefined,
    int? bookId,
    int? pageNumber,
    String? illustrationAsset,
    String? layoutType,
  }) {
    return Page(
      id: id is int? ? id : this.id,
      bookId: bookId ?? this.bookId,
      pageNumber: pageNumber ?? this.pageNumber,
      illustrationAsset: illustrationAsset ?? this.illustrationAsset,
      layoutType: layoutType ?? this.layoutType,
    );
  }
}
