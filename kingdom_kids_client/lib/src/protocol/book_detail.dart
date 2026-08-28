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
import 'age_bracket.dart' as _i2;
import 'book_category.dart' as _i3;
import 'book_page.dart' as _i4;
import 'package:kingdom_kids_client/src/protocol/protocol.dart' as _i5;

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
    required _i2.AgeBracket ageBracketMin,
    required _i2.AgeBracket ageBracketMax,
    required _i3.BookCategory category,
    String? coverImageAsset,
    required List<_i4.BookPage> pages,
  }) = _BookDetailImpl;

  factory BookDetail.fromJson(Map<String, dynamic> jsonSerialization) {
    return BookDetail(
      id: jsonSerialization['id'] as int,
      slug: jsonSerialization['slug'] as String,
      ageBracketMin: _i2.AgeBracket.fromJson(
        (jsonSerialization['ageBracketMin'] as int),
      ),
      ageBracketMax: _i2.AgeBracket.fromJson(
        (jsonSerialization['ageBracketMax'] as int),
      ),
      category: _i3.BookCategory.fromJson(
        (jsonSerialization['category'] as int),
      ),
      coverImageAsset: jsonSerialization['coverImageAsset'] as String?,
      pages: _i5.Protocol().deserialize<List<_i4.BookPage>>(
        jsonSerialization['pages'],
      ),
    );
  }

  int id;

  String slug;

  _i2.AgeBracket ageBracketMin;

  _i2.AgeBracket ageBracketMax;

  _i3.BookCategory category;

  String? coverImageAsset;

  List<_i4.BookPage> pages;

  /// Returns a shallow copy of this [BookDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BookDetail copyWith({
    int? id,
    String? slug,
    _i2.AgeBracket? ageBracketMin,
    _i2.AgeBracket? ageBracketMax,
    _i3.BookCategory? category,
    String? coverImageAsset,
    List<_i4.BookPage>? pages,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BookDetail',
      'id': id,
      'slug': slug,
      'ageBracketMin': ageBracketMin.toJson(),
      'ageBracketMax': ageBracketMax.toJson(),
      'category': category.toJson(),
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
    required _i2.AgeBracket ageBracketMin,
    required _i2.AgeBracket ageBracketMax,
    required _i3.BookCategory category,
    String? coverImageAsset,
    required List<_i4.BookPage> pages,
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
    _i2.AgeBracket? ageBracketMin,
    _i2.AgeBracket? ageBracketMax,
    _i3.BookCategory? category,
    Object? coverImageAsset = _Undefined,
    List<_i4.BookPage>? pages,
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
