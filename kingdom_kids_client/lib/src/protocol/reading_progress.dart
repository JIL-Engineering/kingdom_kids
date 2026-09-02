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

abstract class ReadingProgress implements _i1.SerializableModel {
  ReadingProgress._({
    _i1.UuidValue? id,
    required this.childId,
    required this.bookId,
    required this.currentPage,
    required this.completed,
    required this.startedAt,
    this.completedAt,
    required this.totalTimeSeconds,
    required this.syncedAt,
  }) : id = id ?? const _i1.Uuid().v4obj();

  factory ReadingProgress({
    _i1.UuidValue? id,
    required int childId,
    required int bookId,
    required int currentPage,
    required bool completed,
    required DateTime startedAt,
    DateTime? completedAt,
    required int totalTimeSeconds,
    required DateTime syncedAt,
  }) = _ReadingProgressImpl;

  factory ReadingProgress.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReadingProgress(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      childId: jsonSerialization['childId'] as int,
      bookId: jsonSerialization['bookId'] as int,
      currentPage: jsonSerialization['currentPage'] as int,
      completed: _i1.BoolJsonExtension.fromJson(jsonSerialization['completed']),
      startedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startedAt'],
      ),
      completedAt: jsonSerialization['completedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completedAt'],
            ),
      totalTimeSeconds: jsonSerialization['totalTimeSeconds'] as int,
      syncedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['syncedAt'],
      ),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  int childId;

  int bookId;

  int currentPage;

  bool completed;

  DateTime startedAt;

  DateTime? completedAt;

  int totalTimeSeconds;

  DateTime syncedAt;

  /// Returns a shallow copy of this [ReadingProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReadingProgress copyWith({
    _i1.UuidValue? id,
    int? childId,
    int? bookId,
    int? currentPage,
    bool? completed,
    DateTime? startedAt,
    DateTime? completedAt,
    int? totalTimeSeconds,
    DateTime? syncedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReadingProgress',
      'id': id.toJson(),
      'childId': childId,
      'bookId': bookId,
      'currentPage': currentPage,
      'completed': completed,
      'startedAt': startedAt.toJson(),
      if (completedAt != null) 'completedAt': completedAt?.toJson(),
      'totalTimeSeconds': totalTimeSeconds,
      'syncedAt': syncedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ReadingProgressImpl extends ReadingProgress {
  _ReadingProgressImpl({
    _i1.UuidValue? id,
    required int childId,
    required int bookId,
    required int currentPage,
    required bool completed,
    required DateTime startedAt,
    DateTime? completedAt,
    required int totalTimeSeconds,
    required DateTime syncedAt,
  }) : super._(
         id: id,
         childId: childId,
         bookId: bookId,
         currentPage: currentPage,
         completed: completed,
         startedAt: startedAt,
         completedAt: completedAt,
         totalTimeSeconds: totalTimeSeconds,
         syncedAt: syncedAt,
       );

  /// Returns a shallow copy of this [ReadingProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReadingProgress copyWith({
    _i1.UuidValue? id,
    int? childId,
    int? bookId,
    int? currentPage,
    bool? completed,
    DateTime? startedAt,
    Object? completedAt = _Undefined,
    int? totalTimeSeconds,
    DateTime? syncedAt,
  }) {
    return ReadingProgress(
      id: id ?? this.id,
      childId: childId ?? this.childId,
      bookId: bookId ?? this.bookId,
      currentPage: currentPage ?? this.currentPage,
      completed: completed ?? this.completed,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt is DateTime? ? completedAt : this.completedAt,
      totalTimeSeconds: totalTimeSeconds ?? this.totalTimeSeconds,
      syncedAt: syncedAt ?? this.syncedAt,
    );
  }
}
