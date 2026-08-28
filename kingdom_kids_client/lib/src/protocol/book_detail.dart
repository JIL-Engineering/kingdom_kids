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
import 'book_page.dart' as _i2;
import 'package:kingdom_kids_client/src/protocol/protocol.dart' as _i3;

abstract class BookDetail implements _i1.SerializableModel {
  BookDetail._({
    required this.id,
    required this.slug,
    required this.ageBracketMin,
    required this.ageBracketMax,
    required this.category,
    this.coverImageAsset,
    required this.pages,
  });

  factory BookDetail({
    required int id,
    required String slug,
    required String ageBracketMin,
    required String ageBracketMax,
    required String category,
    String? coverImageAsset,
    required List<_i2.BookPage> pages,
  }) = _BookDetailImpl;

  factory BookDetail.fromJson(Map<String, dynamic> jsonSerialization) {
    return BookDetail(
      id: jsonSerialization['id'] as int,
      slug: jsonSerialization['slug'] as String,
      ageBracketMin: jsonSerialization['ageBracketMin'] as String,
      ageBracketMax: jsonSerialization['ageBracketMax'] as String,
      category: jsonSerialization['category'] as String,
      coverImageAsset: jsonSerialization['coverImageAsset'] as String?,
      pages: _i3.Protocol().deserialize<List<_i2.BookPage>>(
        jsonSerialization['pages'],
      ),
    );
  }

  int id;

  String slug;

  String ageBracketMin;

  String ageBracketMax;

  String category;

  String? coverImageAsset;

  List<_i2.BookPage> pages;

  /// Returns a shallow copy of this [BookDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BookDetail copyWith({
    int? id,
    String? slug,
    String? ageBracketMin,
    String? ageBracketMax,
    String? category,
    String? coverImageAsset,
    List<_i2.BookPage>? pages,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BookDetail',
      'id': id,
      'slug': slug,
      'ageBracketMin': ageBracketMin,
      'ageBracketMax': ageBracketMax,
      'category': category,
      if (coverImageAsset != null) 'coverImageAsset': coverImageAsset,
      'pages': pages.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookDetailImpl extends BookDetail {
  _BookDetailImpl({
    required int id,
    required String slug,
    required String ageBracketMin,
    required String ageBracketMax,
    required String category,
    String? coverImageAsset,
    required List<_i2.BookPage> pages,
  }) : super._(
         id: id,
         slug: slug,
         ageBracketMin: ageBracketMin,
         ageBracketMax: ageBracketMax,
         category: category,
         coverImageAsset: coverImageAsset,
         pages: pages,
       );

  /// Returns a shallow copy of this [BookDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BookDetail copyWith({
    int? id,
    String? slug,
    String? ageBracketMin,
    String? ageBracketMax,
    String? category,
    Object? coverImageAsset = _Undefined,
    List<_i2.BookPage>? pages,
  }) {
    return BookDetail(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      ageBracketMin: ageBracketMin ?? this.ageBracketMin,
      ageBracketMax: ageBracketMax ?? this.ageBracketMax,
      category: category ?? this.category,
      coverImageAsset: coverImageAsset is String?
          ? coverImageAsset
          : this.coverImageAsset,
      pages: pages ?? this.pages.map((e0) => e0.copyWith()).toList(),
    );
  }
}
