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

abstract class Book implements _i1.SerializableModel {
  Book._({
    this.id,
    required this.slug,
    required this.ageBracketMin,
    required this.ageBracketMax,
    required this.category,
    this.coverImageAsset,
    required this.isPublished,
    required this.contentVersion,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Book({
    int? id,
    required String slug,
    required _i2.AgeBracket ageBracketMin,
    required _i2.AgeBracket ageBracketMax,
    required _i3.BookCategory category,
    String? coverImageAsset,
    required bool isPublished,
    required int contentVersion,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) = _BookImpl;

  factory Book.fromJson(Map<String, dynamic> jsonSerialization) {
    return Book(
      id: jsonSerialization['id'] as int?,
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
      isPublished: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isPublished'],
      ),
      contentVersion: jsonSerialization['contentVersion'] as int,
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String slug;

  _i2.AgeBracket ageBracketMin;

  _i2.AgeBracket ageBracketMax;

  _i3.BookCategory category;

  String? coverImageAsset;

  bool isPublished;

  int contentVersion;

  DateTime updatedAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [Book]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Book copyWith({
    int? id,
    String? slug,
    _i2.AgeBracket? ageBracketMin,
    _i2.AgeBracket? ageBracketMax,
    _i3.BookCategory? category,
    String? coverImageAsset,
    bool? isPublished,
    int? contentVersion,
    DateTime? updatedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Book',
      if (id != null) 'id': id,
      'slug': slug,
      'ageBracketMin': ageBracketMin.toJson(),
      'ageBracketMax': ageBracketMax.toJson(),
      'category': category.toJson(),
      if (coverImageAsset != null) 'coverImageAsset': coverImageAsset,
      'isPublished': isPublished,
      'contentVersion': contentVersion,
      'updatedAt': updatedAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookImpl extends Book {
  _BookImpl({
    int? id,
    required String slug,
    required _i2.AgeBracket ageBracketMin,
    required _i2.AgeBracket ageBracketMax,
    required _i3.BookCategory category,
    String? coverImageAsset,
    required bool isPublished,
    required int contentVersion,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         slug: slug,
         ageBracketMin: ageBracketMin,
         ageBracketMax: ageBracketMax,
         category: category,
         coverImageAsset: coverImageAsset,
         isPublished: isPublished,
         contentVersion: contentVersion,
         updatedAt: updatedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Book]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Book copyWith({
    Object? id = _Undefined,
    String? slug,
    _i2.AgeBracket? ageBracketMin,
    _i2.AgeBracket? ageBracketMax,
    _i3.BookCategory? category,
    Object? coverImageAsset = _Undefined,
    bool? isPublished,
    int? contentVersion,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Book(
      id: id is int? ? id : this.id,
      slug: slug ?? this.slug,
      ageBracketMin: ageBracketMin ?? this.ageBracketMin,
      ageBracketMax: ageBracketMax ?? this.ageBracketMax,
      category: category ?? this.category,
      coverImageAsset: coverImageAsset is String?
          ? coverImageAsset
          : this.coverImageAsset,
      isPublished: isPublished ?? this.isPublished,
      contentVersion: contentVersion ?? this.contentVersion,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
