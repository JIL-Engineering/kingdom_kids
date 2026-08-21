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
    this.id,
    required this.child_id,
    required this.book_id,
    required this.current_page,
    required this.completed,
    required this.started_at,
    this.completed_at,
    required this.total_time_seconds,
    required this.synced_at,
  });

  factory ReadingProgress({
    int? id,
    required int child_id,
    required int book_id,
    required int current_page,
    required bool completed,
    required DateTime started_at,
    DateTime? completed_at,
    required int total_time_seconds,
    required DateTime synced_at,
  }) = _ReadingProgressImpl;

  factory ReadingProgress.fromJson(Map<String, dynamic> jsonSerialization) {
    return ReadingProgress(
      id: jsonSerialization['id'] as int?,
      child_id: jsonSerialization['child_id'] as int,
      book_id: jsonSerialization['book_id'] as int,
      current_page: jsonSerialization['current_page'] as int,
      completed: _i1.BoolJsonExtension.fromJson(jsonSerialization['completed']),
      started_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['started_at'],
      ),
      completed_at: jsonSerialization['completed_at'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['completed_at'],
            ),
      total_time_seconds: jsonSerialization['total_time_seconds'] as int,
      synced_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['synced_at'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int child_id;

  int book_id;

  int current_page;

  bool completed;

  DateTime started_at;

  DateTime? completed_at;

  int total_time_seconds;

  DateTime synced_at;

  /// Returns a shallow copy of this [ReadingProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ReadingProgress copyWith({
    int? id,
    int? child_id,
    int? book_id,
    int? current_page,
    bool? completed,
    DateTime? started_at,
    DateTime? completed_at,
    int? total_time_seconds,
    DateTime? synced_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ReadingProgress',
      if (id != null) 'id': id,
      'child_id': child_id,
      'book_id': book_id,
      'current_page': current_page,
      'completed': completed,
      'started_at': started_at.toJson(),
      if (completed_at != null) 'completed_at': completed_at?.toJson(),
      'total_time_seconds': total_time_seconds,
      'synced_at': synced_at.toJson(),
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
    int? id,
    required int child_id,
    required int book_id,
    required int current_page,
    required bool completed,
    required DateTime started_at,
    DateTime? completed_at,
    required int total_time_seconds,
    required DateTime synced_at,
  }) : super._(
         id: id,
         child_id: child_id,
         book_id: book_id,
         current_page: current_page,
         completed: completed,
         started_at: started_at,
         completed_at: completed_at,
         total_time_seconds: total_time_seconds,
         synced_at: synced_at,
       );

  /// Returns a shallow copy of this [ReadingProgress]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ReadingProgress copyWith({
    Object? id = _Undefined,
    int? child_id,
    int? book_id,
    int? current_page,
    bool? completed,
    DateTime? started_at,
    Object? completed_at = _Undefined,
    int? total_time_seconds,
    DateTime? synced_at,
  }) {
    return ReadingProgress(
      id: id is int? ? id : this.id,
      child_id: child_id ?? this.child_id,
      book_id: book_id ?? this.book_id,
      current_page: current_page ?? this.current_page,
      completed: completed ?? this.completed,
      started_at: started_at ?? this.started_at,
      completed_at: completed_at is DateTime?
          ? completed_at
          : this.completed_at,
      total_time_seconds: total_time_seconds ?? this.total_time_seconds,
      synced_at: synced_at ?? this.synced_at,
    );
  }
}
