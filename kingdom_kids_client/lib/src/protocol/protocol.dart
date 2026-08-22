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
import 'badge.dart' as _i2;
import 'book.dart' as _i3;
import 'book_translation.dart' as _i4;
import 'child_badge.dart' as _i5;
import 'child_profile.dart' as _i6;
import 'devotional.dart' as _i7;
import 'devotional_translation.dart' as _i8;
import 'download_record.dart' as _i9;
import 'greetings/greeting.dart' as _i10;
import 'page.dart' as _i11;
import 'page_content.dart' as _i12;
import 'reading_progress.dart' as _i13;
import 'user.dart' as _i14;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i15;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i16;
export 'badge.dart';
export 'book.dart';
export 'book_translation.dart';
export 'child_badge.dart';
export 'child_profile.dart';
export 'devotional.dart';
export 'devotional_translation.dart';
export 'download_record.dart';
export 'greetings/greeting.dart';
export 'page.dart';
export 'page_content.dart';
export 'reading_progress.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Badge) {
      return _i2.Badge.fromJson(data) as T;
    }
    if (t == _i3.Book) {
      return _i3.Book.fromJson(data) as T;
    }
    if (t == _i4.BookTranslation) {
      return _i4.BookTranslation.fromJson(data) as T;
    }
    if (t == _i5.ChildBadge) {
      return _i5.ChildBadge.fromJson(data) as T;
    }
    if (t == _i6.ChildProfile) {
      return _i6.ChildProfile.fromJson(data) as T;
    }
    if (t == _i7.Devotional) {
      return _i7.Devotional.fromJson(data) as T;
    }
    if (t == _i8.DevotionalTranslation) {
      return _i8.DevotionalTranslation.fromJson(data) as T;
    }
    if (t == _i9.DownloadRecord) {
      return _i9.DownloadRecord.fromJson(data) as T;
    }
    if (t == _i10.Greeting) {
      return _i10.Greeting.fromJson(data) as T;
    }
    if (t == _i11.Page) {
      return _i11.Page.fromJson(data) as T;
    }
    if (t == _i12.PageContent) {
      return _i12.PageContent.fromJson(data) as T;
    }
    if (t == _i13.ReadingProgress) {
      return _i13.ReadingProgress.fromJson(data) as T;
    }
    if (t == _i14.User) {
      return _i14.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Badge?>()) {
      return (data != null ? _i2.Badge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Book?>()) {
      return (data != null ? _i3.Book.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.BookTranslation?>()) {
      return (data != null ? _i4.BookTranslation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ChildBadge?>()) {
      return (data != null ? _i5.ChildBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ChildProfile?>()) {
      return (data != null ? _i6.ChildProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Devotional?>()) {
      return (data != null ? _i7.Devotional.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DevotionalTranslation?>()) {
      return (data != null ? _i8.DevotionalTranslation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.DownloadRecord?>()) {
      return (data != null ? _i9.DownloadRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Greeting?>()) {
      return (data != null ? _i10.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Page?>()) {
      return (data != null ? _i11.Page.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.PageContent?>()) {
      return (data != null ? _i12.PageContent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ReadingProgress?>()) {
      return (data != null ? _i13.ReadingProgress.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.User?>()) {
      return (data != null ? _i14.User.fromJson(data) : null) as T;
    }
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Badge => 'Badge',
      _i3.Book => 'Book',
      _i4.BookTranslation => 'BookTranslation',
      _i5.ChildBadge => 'ChildBadge',
      _i6.ChildProfile => 'ChildProfile',
      _i7.Devotional => 'Devotional',
      _i8.DevotionalTranslation => 'DevotionalTranslation',
      _i9.DownloadRecord => 'DownloadRecord',
      _i10.Greeting => 'Greeting',
      _i11.Page => 'Page',
      _i12.PageContent => 'PageContent',
      _i13.ReadingProgress => 'ReadingProgress',
      _i14.User => 'User',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'kingdom_kids.',
        '',
      );
    }

    switch (data) {
      case _i2.Badge():
        return 'Badge';
      case _i3.Book():
        return 'Book';
      case _i4.BookTranslation():
        return 'BookTranslation';
      case _i5.ChildBadge():
        return 'ChildBadge';
      case _i6.ChildProfile():
        return 'ChildProfile';
      case _i7.Devotional():
        return 'Devotional';
      case _i8.DevotionalTranslation():
        return 'DevotionalTranslation';
      case _i9.DownloadRecord():
        return 'DownloadRecord';
      case _i10.Greeting():
        return 'Greeting';
      case _i11.Page():
        return 'Page';
      case _i12.PageContent():
        return 'PageContent';
      case _i13.ReadingProgress():
        return 'ReadingProgress';
      case _i14.User():
        return 'User';
    }
    className = _i15.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Badge') {
      return deserialize<_i2.Badge>(data['data']);
    }
    if (dataClassName == 'Book') {
      return deserialize<_i3.Book>(data['data']);
    }
    if (dataClassName == 'BookTranslation') {
      return deserialize<_i4.BookTranslation>(data['data']);
    }
    if (dataClassName == 'ChildBadge') {
      return deserialize<_i5.ChildBadge>(data['data']);
    }
    if (dataClassName == 'ChildProfile') {
      return deserialize<_i6.ChildProfile>(data['data']);
    }
    if (dataClassName == 'Devotional') {
      return deserialize<_i7.Devotional>(data['data']);
    }
    if (dataClassName == 'DevotionalTranslation') {
      return deserialize<_i8.DevotionalTranslation>(data['data']);
    }
    if (dataClassName == 'DownloadRecord') {
      return deserialize<_i9.DownloadRecord>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i10.Greeting>(data['data']);
    }
    if (dataClassName == 'Page') {
      return deserialize<_i11.Page>(data['data']);
    }
    if (dataClassName == 'PageContent') {
      return deserialize<_i12.PageContent>(data['data']);
    }
    if (dataClassName == 'ReadingProgress') {
      return deserialize<_i13.ReadingProgress>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i14.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i15.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i15.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i16.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
