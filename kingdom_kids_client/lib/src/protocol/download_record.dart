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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class DownloadRecord
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  DownloadRecord._({
    this.id,
    required this.childId,
    required this.bookId,
    required this.deviceId,
    required this.downloadedAt,
  });

  factory DownloadRecord({
    int? id,
    required int childId,
    required int bookId,
    required String deviceId,
    required DateTime downloadedAt,
  }) = _DownloadRecordImpl;

  factory DownloadRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return DownloadRecord(
      id: jsonSerialization['id'] as int?,
      childId: jsonSerialization['childId'] as int,
      bookId: jsonSerialization['bookId'] as int,
      deviceId: jsonSerialization['deviceId'] as String,
      downloadedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['downloadedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int childId;

  int bookId;

  String deviceId;

  DateTime downloadedAt;

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  DownloadRecord copyWith({
    int? id,
    int? childId,
    int? bookId,
    String? deviceId,
    DateTime? downloadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DownloadRecord',
      if (id != null) 'id': id,
      'childId': childId,
      'bookId': bookId,
      'deviceId': deviceId,
      'downloadedAt': downloadedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DownloadRecord',
      if (id != null) 'id': id,
      'childId': childId,
      'bookId': bookId,
      'deviceId': deviceId,
      'downloadedAt': downloadedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DownloadRecordImpl extends DownloadRecord {
  _DownloadRecordImpl({
    int? id,
    required int childId,
    required int bookId,
    required String deviceId,
    required DateTime downloadedAt,
  }) : super._(
         id: id,
         childId: childId,
         bookId: bookId,
         deviceId: deviceId,
         downloadedAt: downloadedAt,
       );

  /// Returns a shallow copy of this [DownloadRecord]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  DownloadRecord copyWith({
    Object? id = _Undefined,
    int? childId,
    int? bookId,
    String? deviceId,
    DateTime? downloadedAt,
  }) {
    return DownloadRecord(
      id: id is int? ? id : this.id,
      childId: childId ?? this.childId,
      bookId: bookId ?? this.bookId,
      deviceId: deviceId ?? this.deviceId,
      downloadedAt: downloadedAt ?? this.downloadedAt,
    );
  }
}
