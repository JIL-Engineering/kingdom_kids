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

abstract class DevotionalTranslation implements _i1.SerializableModel {
  DevotionalTranslation._({
    this.id,
    required this.devotional_id,
    required this.language,
    required this.verse_reference,
    required this.verse_text,
    required this.thought_text,
    required this.prayer_prompt,
  });

  factory DevotionalTranslation({
    int? id,
    required int devotional_id,
    required String language,
    required String verse_reference,
    required String verse_text,
    required String thought_text,
    required String prayer_prompt,
  }) = _DevotionalTranslationImpl;

  factory DevotionalTranslation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DevotionalTranslation(
      id: jsonSerialization['id'] as int?,
      devotional_id: jsonSerialization['devotional_id'] as int,
      language: jsonSerialization['language'] as String,
      verse_reference: jsonSerialization['verse_reference'] as String,
      verse_text: jsonSerialization['verse_text'] as String,
      thought_text: jsonSerialization['thought_text'] as String,
      prayer_prompt: jsonSerialization['prayer_prompt'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int devotional_id;

  String language;

  String verse_reference;

  String verse_text;

  String thought_text;

  String prayer_prompt;

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DevotionalTranslation copyWith({
    int? id,
    int? devotional_id,
    String? language,
    String? verse_reference,
    String? verse_text,
    String? thought_text,
    String? prayer_prompt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DevotionalTranslation',
      if (id != null) 'id': id,
      'devotional_id': devotional_id,
      'language': language,
      'verse_reference': verse_reference,
      'verse_text': verse_text,
      'thought_text': thought_text,
      'prayer_prompt': prayer_prompt,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DevotionalTranslationImpl extends DevotionalTranslation {
  _DevotionalTranslationImpl({
    int? id,
    required int devotional_id,
    required String language,
    required String verse_reference,
    required String verse_text,
    required String thought_text,
    required String prayer_prompt,
  }) : super._(
         id: id,
         devotional_id: devotional_id,
         language: language,
         verse_reference: verse_reference,
         verse_text: verse_text,
         thought_text: thought_text,
         prayer_prompt: prayer_prompt,
       );

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DevotionalTranslation copyWith({
    Object? id = _Undefined,
    int? devotional_id,
    String? language,
    String? verse_reference,
    String? verse_text,
    String? thought_text,
    String? prayer_prompt,
  }) {
    return DevotionalTranslation(
      id: id is int? ? id : this.id,
      devotional_id: devotional_id ?? this.devotional_id,
      language: language ?? this.language,
      verse_reference: verse_reference ?? this.verse_reference,
      verse_text: verse_text ?? this.verse_text,
      thought_text: thought_text ?? this.thought_text,
      prayer_prompt: prayer_prompt ?? this.prayer_prompt,
    );
  }
}
