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
    required this.devotionalId,
    required this.language,
    required this.verseReference,
    required this.verseText,
    required this.thoughtText,
    required this.prayerPrompt,
  });

  factory DevotionalTranslation({
    int? id,
    required int devotionalId,
    required String language,
    required String verseReference,
    required String verseText,
    required String thoughtText,
    required String prayerPrompt,
  }) = _DevotionalTranslationImpl;

  factory DevotionalTranslation.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DevotionalTranslation(
      id: jsonSerialization['id'] as int?,
      devotionalId: jsonSerialization['devotionalId'] as int,
      language: jsonSerialization['language'] as String,
      verseReference: jsonSerialization['verseReference'] as String,
      verseText: jsonSerialization['verseText'] as String,
      thoughtText: jsonSerialization['thoughtText'] as String,
      prayerPrompt: jsonSerialization['prayerPrompt'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int devotionalId;

  String language;

  String verseReference;

  String verseText;

  String thoughtText;

  String prayerPrompt;

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DevotionalTranslation copyWith({
    int? id,
    int? devotionalId,
    String? language,
    String? verseReference,
    String? verseText,
    String? thoughtText,
    String? prayerPrompt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DevotionalTranslation',
      if (id != null) 'id': id,
      'devotionalId': devotionalId,
      'language': language,
      'verseReference': verseReference,
      'verseText': verseText,
      'thoughtText': thoughtText,
      'prayerPrompt': prayerPrompt,
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
    required int devotionalId,
    required String language,
    required String verseReference,
    required String verseText,
    required String thoughtText,
    required String prayerPrompt,
  }) : super._(
         id: id,
         devotionalId: devotionalId,
         language: language,
         verseReference: verseReference,
         verseText: verseText,
         thoughtText: thoughtText,
         prayerPrompt: prayerPrompt,
       );

  /// Returns a shallow copy of this [DevotionalTranslation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DevotionalTranslation copyWith({
    Object? id = _Undefined,
    int? devotionalId,
    String? language,
    String? verseReference,
    String? verseText,
    String? thoughtText,
    String? prayerPrompt,
  }) {
    return DevotionalTranslation(
      id: id is int? ? id : this.id,
      devotionalId: devotionalId ?? this.devotionalId,
      language: language ?? this.language,
      verseReference: verseReference ?? this.verseReference,
      verseText: verseText ?? this.verseText,
      thoughtText: thoughtText ?? this.thoughtText,
      prayerPrompt: prayerPrompt ?? this.prayerPrompt,
    );
  }
}
