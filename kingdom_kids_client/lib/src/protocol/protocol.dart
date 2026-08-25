/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'app_user.dart' as _i2j2xfrn;
import 'auth_response.dart' as _iuyz7l8a;
import 'badge.dart' as _i55tj3uz;
import 'book.dart' as _ik00prxe;
import 'book_translation.dart' as _imevw7eg;
import 'child_badge.dart' as _ikzyrfdf;
import 'child_profile.dart' as _iqdrsmlr;
import 'devotionnal.dart' as _iz0indg2;
import 'devotionnal_translation.dart' as _iu8kheyc;
import 'download_record.dart' as _i6q4hmyd;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'page.dart' as _imk4symu;
import 'page_content.dart' as _idzt3dm3;
import 'reading_progress.dart' as _i2h1sfz6;
export 'app_user.dart';
export 'auth_response.dart';
export 'badge.dart';
export 'book.dart';
export 'book_translation.dart';
export 'child_badge.dart';
export 'child_profile.dart';
export 'devotionnal.dart';
export 'devotionnal_translation.dart';
export 'download_record.dart';
export 'greetings/greeting.dart';
export 'page.dart';
export 'page_content.dart';
export 'reading_progress.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

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

    if (t == _i2j2xfrn.AppUser) {
      return _i2j2xfrn.AppUser.fromJson(data) as T;
    }
    if (t == _iuyz7l8a.AuthResponse) {
      return _iuyz7l8a.AuthResponse.fromJson(data) as T;
    }
    if (t == _i55tj3uz.Badge) {
      return _i55tj3uz.Badge.fromJson(data) as T;
    }
    if (t == _ik00prxe.Book) {
      return _ik00prxe.Book.fromJson(data) as T;
    }
    if (t == _imevw7eg.BookTranslation) {
      return _imevw7eg.BookTranslation.fromJson(data) as T;
    }
    if (t == _ikzyrfdf.ChildBadge) {
      return _ikzyrfdf.ChildBadge.fromJson(data) as T;
    }
    if (t == _iqdrsmlr.ChildProfile) {
      return _iqdrsmlr.ChildProfile.fromJson(data) as T;
    }
    if (t == _iz0indg2.Devotional) {
      return _iz0indg2.Devotional.fromJson(data) as T;
    }
    if (t == _iu8kheyc.DevotionalTranslation) {
      return _iu8kheyc.DevotionalTranslation.fromJson(data) as T;
    }
    if (t == _i6q4hmyd.DownloadRecord) {
      return _i6q4hmyd.DownloadRecord.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _imk4symu.Page) {
      return _imk4symu.Page.fromJson(data) as T;
    }
    if (t == _idzt3dm3.PageContent) {
      return _idzt3dm3.PageContent.fromJson(data) as T;
    }
    if (t == _i2h1sfz6.ReadingProgress) {
      return _i2h1sfz6.ReadingProgress.fromJson(data) as T;
    }
    if (t == _isc.getType<_i2j2xfrn.AppUser?>()) {
      return (data != null ? _i2j2xfrn.AppUser.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iuyz7l8a.AuthResponse?>()) {
      return (data != null ? _iuyz7l8a.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i55tj3uz.Badge?>()) {
      return (data != null ? _i55tj3uz.Badge.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ik00prxe.Book?>()) {
      return (data != null ? _ik00prxe.Book.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_imevw7eg.BookTranslation?>()) {
      return (data != null ? _imevw7eg.BookTranslation.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ikzyrfdf.ChildBadge?>()) {
      return (data != null ? _ikzyrfdf.ChildBadge.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iqdrsmlr.ChildProfile?>()) {
      return (data != null ? _iqdrsmlr.ChildProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iz0indg2.Devotional?>()) {
      return (data != null ? _iz0indg2.Devotional.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iu8kheyc.DevotionalTranslation?>()) {
      return (data != null
              ? _iu8kheyc.DevotionalTranslation.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i6q4hmyd.DownloadRecord?>()) {
      return (data != null ? _i6q4hmyd.DownloadRecord.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_imk4symu.Page?>()) {
      return (data != null ? _imk4symu.Page.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_idzt3dm3.PageContent?>()) {
      return (data != null ? _idzt3dm3.PageContent.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2h1sfz6.ReadingProgress?>()) {
      return (data != null ? _i2h1sfz6.ReadingProgress.fromJson(data) : null)
          as T;
    }
    if (t == Map<String, dynamic>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<dynamic>(v)),
          )
          as T;
    }
    if (t == dynamic) {
      return deserializeDynamicFieldValue(data) as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2j2xfrn.AppUser => 'AppUser',
      _iuyz7l8a.AuthResponse => 'AuthResponse',
      _i55tj3uz.Badge => 'Badge',
      _ik00prxe.Book => 'Book',
      _imevw7eg.BookTranslation => 'BookTranslation',
      _ikzyrfdf.ChildBadge => 'ChildBadge',
      _iqdrsmlr.ChildProfile => 'ChildProfile',
      _iz0indg2.Devotional => 'Devotional',
      _iu8kheyc.DevotionalTranslation => 'DevotionalTranslation',
      _i6q4hmyd.DownloadRecord => 'DownloadRecord',
      _izw8z7ou.Greeting => 'Greeting',
      _imk4symu.Page => 'Page',
      _idzt3dm3.PageContent => 'PageContent',
      _i2h1sfz6.ReadingProgress => 'ReadingProgress',
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
      case _i2j2xfrn.AppUser():
        return 'AppUser';
      case _iuyz7l8a.AuthResponse():
        return 'AuthResponse';
      case _i55tj3uz.Badge():
        return 'Badge';
      case _ik00prxe.Book():
        return 'Book';
      case _imevw7eg.BookTranslation():
        return 'BookTranslation';
      case _ikzyrfdf.ChildBadge():
        return 'ChildBadge';
      case _iqdrsmlr.ChildProfile():
        return 'ChildProfile';
      case _iz0indg2.Devotional():
        return 'Devotional';
      case _iu8kheyc.DevotionalTranslation():
        return 'DevotionalTranslation';
      case _i6q4hmyd.DownloadRecord():
        return 'DownloadRecord';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _imk4symu.Page():
        return 'Page';
      case _idzt3dm3.PageContent():
        return 'PageContent';
      case _i2h1sfz6.ReadingProgress():
        return 'ReadingProgress';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i2j2xfrn.AppUser>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_iuyz7l8a.AuthResponse>(data['data']);
    }
    if (dataClassName == 'Badge') {
      return deserialize<_i55tj3uz.Badge>(data['data']);
    }
    if (dataClassName == 'Book') {
      return deserialize<_ik00prxe.Book>(data['data']);
    }
    if (dataClassName == 'BookTranslation') {
      return deserialize<_imevw7eg.BookTranslation>(data['data']);
    }
    if (dataClassName == 'ChildBadge') {
      return deserialize<_ikzyrfdf.ChildBadge>(data['data']);
    }
    if (dataClassName == 'ChildProfile') {
      return deserialize<_iqdrsmlr.ChildProfile>(data['data']);
    }
    if (dataClassName == 'Devotional') {
      return deserialize<_iz0indg2.Devotional>(data['data']);
    }
    if (dataClassName == 'DevotionalTranslation') {
      return deserialize<_iu8kheyc.DevotionalTranslation>(data['data']);
    }
    if (dataClassName == 'DownloadRecord') {
      return deserialize<_i6q4hmyd.DownloadRecord>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Page') {
      return deserialize<_imk4symu.Page>(data['data']);
    }
    if (dataClassName == 'PageContent') {
      return deserialize<_idzt3dm3.PageContent>(data['data']);
    }
    if (dataClassName == 'ReadingProgress') {
      return deserialize<_i2h1sfz6.ReadingProgress>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('kingdom_kids', this);
    _iacc.Protocol().registerHostProtocol('kingdom_kids', this);
  }

  @override
  String getModuleName() => 'kingdom_kids';

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
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
