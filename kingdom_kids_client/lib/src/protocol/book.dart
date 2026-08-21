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

abstract class Book implements _i1.SerializableModel {
  Book._({
    this.id,
    required this.slug,
    required this.age_bracket_min,
    required this.age_bracket_max,
    required this.category,
    this.cover_image_asset,
    required this.is_published,
    required this.content_version,
    required this.updated_at,
    required this.created_at,
  });

  factory Book({
    int? id,
    required String slug,
    required String age_bracket_min,
    required String age_bracket_max,
    required String category,
    String? cover_image_asset,
    required bool is_published,
    required int content_version,
    required DateTime updated_at,
    required DateTime created_at,
  }) = _BookImpl;

  factory Book.fromJson(Map<String, dynamic> jsonSerialization) {
    return Book(
      id: jsonSerialization['id'] as int?,
      slug: jsonSerialization['slug'] as String,
      age_bracket_min: jsonSerialization['age_bracket_min'] as String,
      age_bracket_max: jsonSerialization['age_bracket_max'] as String,
      category: jsonSerialization['category'] as String,
      cover_image_asset: jsonSerialization['cover_image_asset'] as String?,
      is_published: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['is_published'],
      ),
      content_version: jsonSerialization['content_version'] as int,
      updated_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updated_at'],
      ),
      created_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['created_at'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String slug;

  String age_bracket_min;

  String age_bracket_max;

  String category;

  String? cover_image_asset;

  bool is_published;

  int content_version;

  DateTime updated_at;

  DateTime created_at;

  /// Returns a shallow copy of this [Book]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Book copyWith({
    int? id,
    String? slug,
    String? age_bracket_min,
    String? age_bracket_max,
    String? category,
    String? cover_image_asset,
    bool? is_published,
    int? content_version,
    DateTime? updated_at,
    DateTime? created_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Book',
      if (id != null) 'id': id,
      'slug': slug,
      'age_bracket_min': age_bracket_min,
      'age_bracket_max': age_bracket_max,
      'category': category,
      if (cover_image_asset != null) 'cover_image_asset': cover_image_asset,
      'is_published': is_published,
      'content_version': content_version,
      'updated_at': updated_at.toJson(),
      'created_at': created_at.toJson(),
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
    required String age_bracket_min,
    required String age_bracket_max,
    required String category,
    String? cover_image_asset,
    required bool is_published,
    required int content_version,
    required DateTime updated_at,
    required DateTime created_at,
  }) : super._(
         id: id,
         slug: slug,
         age_bracket_min: age_bracket_min,
         age_bracket_max: age_bracket_max,
         category: category,
         cover_image_asset: cover_image_asset,
         is_published: is_published,
         content_version: content_version,
         updated_at: updated_at,
         created_at: created_at,
       );

  /// Returns a shallow copy of this [Book]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Book copyWith({
    Object? id = _Undefined,
    String? slug,
    String? age_bracket_min,
    String? age_bracket_max,
    String? category,
    Object? cover_image_asset = _Undefined,
    bool? is_published,
    int? content_version,
    DateTime? updated_at,
    DateTime? created_at,
  }) {
    return Book(
      id: id is int? ? id : this.id,
      slug: slug ?? this.slug,
      age_bracket_min: age_bracket_min ?? this.age_bracket_min,
      age_bracket_max: age_bracket_max ?? this.age_bracket_max,
      category: category ?? this.category,
      cover_image_asset: cover_image_asset is String?
          ? cover_image_asset
          : this.cover_image_asset,
      is_published: is_published ?? this.is_published,
      content_version: content_version ?? this.content_version,
      updated_at: updated_at ?? this.updated_at,
      created_at: created_at ?? this.created_at,
    );
  }
}
