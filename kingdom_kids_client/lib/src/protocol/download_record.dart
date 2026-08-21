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

abstract class DownloadRecord implements _i1.SerializableModel {
  DownloadRecord._({
    this.id,
    required this.child_id,
    required this.book_id,
    required this.device_id,
    required this.downloaded_at,
  });

  factory DownloadRecord({
    int? id,
    required int child_id,
    required int book_id,
    required String device_id,
    required DateTime downloaded_at,
  }) = _DownloadRecordImpl;

  factory DownloadRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return DownloadRecord(
      id: jsonSerialization['id'] as int?,
      child_id: jsonSerialization['child_id'] as int,
      book_id: jsonSerialization['book_id'] as int,
      device_id: jsonSerialization['device_id'] as String,
      downloaded_at: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['downloaded_at'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int child_id;

  int book_id;

  String device_id;

  DateTime downloaded_at;

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DownloadRecord copyWith({
    int? id,
    int? child_id,
    int? book_id,
    String? device_id,
    DateTime? downloaded_at,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DownloadRecord',
      if (id != null) 'id': id,
      'child_id': child_id,
      'book_id': book_id,
      'device_id': device_id,
      'downloaded_at': downloaded_at.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DownloadRecordImpl extends DownloadRecord {
  _DownloadRecordImpl({
    int? id,
    required int child_id,
    required int book_id,
    required String device_id,
    required DateTime downloaded_at,
  }) : super._(
         id: id,
         child_id: child_id,
         book_id: book_id,
         device_id: device_id,
         downloaded_at: downloaded_at,
       );

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DownloadRecord copyWith({
    Object? id = _Undefined,
    int? child_id,
    int? book_id,
    String? device_id,
    DateTime? downloaded_at,
  }) {
    return DownloadRecord(
      id: id is int? ? id : this.id,
      child_id: child_id ?? this.child_id,
      book_id: book_id ?? this.book_id,
      device_id: device_id ?? this.device_id,
      downloaded_at: downloaded_at ?? this.downloaded_at,
    );
  }
}
