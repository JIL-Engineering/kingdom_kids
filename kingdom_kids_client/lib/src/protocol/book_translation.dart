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

abstract class BookTranslation implements _i1.SerializableModel {
  BookTranslation._({
    this.id,
    required this.book_id,
    required this.language,
    required this.title,
  });

  factory BookTranslation({
    int? id,
    required int book_id,
    required String language,
    required String title,
  }) = _BookTranslationImpl;

  factory BookTranslation.fromJson(Map<String, dynamic> jsonSerialization) {
    return BookTranslation(
      id: jsonSerialization['id'] as int?,
      book_id: jsonSerialization['book_id'] as int,
      language: jsonSerialization['language'] as String,
      title: jsonSerialization['title'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int book_id;

  String language;

  String title;

  /// Returns a shallow copy of this [BookTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BookTranslation copyWith({
    int? id,
    int? book_id,
    String? language,
    String? title,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BookTranslation',
      if (id != null) 'id': id,
      'book_id': book_id,
      'language': language,
      'title': title,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookTranslationImpl extends BookTranslation {
  _BookTranslationImpl({
    int? id,
    required int book_id,
    required String language,
    required String title,
  }) : super._(
         id: id,
         book_id: book_id,
         language: language,
         title: title,
       );

  /// Returns a shallow copy of this [BookTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BookTranslation copyWith({
    Object? id = _Undefined,
    int? book_id,
    String? language,
    String? title,
  }) {
    return BookTranslation(
      id: id is int? ? id : this.id,
      book_id: book_id ?? this.book_id,
      language: language ?? this.language,
      title: title ?? this.title,
    );
  }
}
