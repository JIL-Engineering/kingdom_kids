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

abstract class BookSummary implements _i1.SerializableModel {
  BookSummary._({
    required this.id,
    required this.slug,
    required this.ageBracketMin,
    required this.ageBracketMax,
    required this.category,
    this.coverImageAsset,
  });

  factory BookSummary({
    required int id,
    required String slug,
    required String ageBracketMin,
    required String ageBracketMax,
    required String category,
    String? coverImageAsset,
  }) = _BookSummaryImpl;

  factory BookSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return BookSummary(
      id: jsonSerialization['id'] as int,
      slug: jsonSerialization['slug'] as String,
      ageBracketMin: jsonSerialization['ageBracketMin'] as String,
      ageBracketMax: jsonSerialization['ageBracketMax'] as String,
      category: jsonSerialization['category'] as String,
      coverImageAsset: jsonSerialization['coverImageAsset'] as String?,
    );
  }

  int id;

  String slug;

  String ageBracketMin;

  String ageBracketMax;

  String category;

  String? coverImageAsset;

  /// Returns a shallow copy of this [BookSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BookSummary copyWith({
    int? id,
    String? slug,
    String? ageBracketMin,
    String? ageBracketMax,
    String? category,
    String? coverImageAsset,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BookSummary',
      'id': id,
      'slug': slug,
      'ageBracketMin': ageBracketMin,
      'ageBracketMax': ageBracketMax,
      'category': category,
      if (coverImageAsset != null) 'coverImageAsset': coverImageAsset,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookSummaryImpl extends BookSummary {
  _BookSummaryImpl({
    required int id,
    required String slug,
    required String ageBracketMin,
    required String ageBracketMax,
    required String category,
    String? coverImageAsset,
  }) : super._(
         id: id,
         slug: slug,
         ageBracketMin: ageBracketMin,
         ageBracketMax: ageBracketMax,
         category: category,
         coverImageAsset: coverImageAsset,
       );

  /// Returns a shallow copy of this [BookSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BookSummary copyWith({
    int? id,
    String? slug,
    String? ageBracketMin,
    String? ageBracketMax,
    String? category,
    Object? coverImageAsset = _Undefined,
  }) {
    return BookSummary(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      ageBracketMin: ageBracketMin ?? this.ageBracketMin,
      ageBracketMax: ageBracketMax ?? this.ageBracketMax,
      category: category ?? this.category,
      coverImageAsset: coverImageAsset is String?
          ? coverImageAsset
          : this.coverImageAsset,
    );
  }
}
