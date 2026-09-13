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
import 'age_bracket.dart' as _i2;
import 'app_language.dart' as _i3;
import 'app_user.dart' as _i4;
import 'auth_response.dart' as _i5;
import 'badge.dart' as _i6;
import 'book.dart' as _i7;
import 'book_category.dart' as _i8;
import 'book_detail.dart' as _i9;
import 'book_page.dart' as _i10;
import 'book_summary.dart' as _i11;
import 'book_translation.dart' as _i12;
import 'child_badge.dart' as _i13;
import 'child_profile.dart' as _i14;
import 'devotional.dart' as _i15;
import 'devotional_translation.dart' as _i16;
import 'download_asset.dart' as _i17;
import 'download_bundle.dart' as _i18;
import 'download_record.dart' as _i19;
import 'greetings/greeting.dart' as _i20;
import 'page.dart' as _i21;
import 'page_content.dart' as _i22;
import 'reading_progress.dart' as _i23;
import 'package:kingdom_kids_client/src/protocol/child_profile.dart' as _i24;
import 'package:kingdom_kids_client/src/protocol/book_summary.dart' as _i25;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i26;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i27;
export 'age_bracket.dart';
export 'app_language.dart';
export 'app_user.dart';
export 'auth_response.dart';
export 'badge.dart';
export 'book.dart';
export 'book_category.dart';
export 'book_detail.dart';
export 'book_page.dart';
export 'book_summary.dart';
export 'book_translation.dart';
export 'child_badge.dart';
export 'child_profile.dart';
export 'devotional.dart';
export 'devotional_translation.dart';
export 'download_asset.dart';
export 'download_bundle.dart';
export 'download_record.dart';
export 'greetings/greeting.dart';
export 'page.dart';
export 'page_content.dart';
export 'reading_progress.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
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

    if (t == _i2.AgeBracket) {
      return _i2.AgeBracket.fromJson(data) as T;
    }
    if (t == _i3.AppLanguage) {
      return _i3.AppLanguage.fromJson(data) as T;
    }
    if (t == _i4.AppUser) {
      return _i4.AppUser.fromJson(data) as T;
    }
    if (t == _i5.AuthResponse) {
      return _i5.AuthResponse.fromJson(data) as T;
    }
    if (t == _i6.Badge) {
      return _i6.Badge.fromJson(data) as T;
    }
    if (t == _i7.Book) {
      return _i7.Book.fromJson(data) as T;
    }
    if (t == _i8.BookCategory) {
      return _i8.BookCategory.fromJson(data) as T;
    }
    if (t == _i9.BookDetail) {
      return _i9.BookDetail.fromJson(data) as T;
    }
    if (t == _i10.BookPage) {
      return _i10.BookPage.fromJson(data) as T;
    }
    if (t == _i11.BookSummary) {
      return _i11.BookSummary.fromJson(data) as T;
    }
    if (t == _i12.BookTranslation) {
      return _i12.BookTranslation.fromJson(data) as T;
    }
    if (t == _i13.ChildBadge) {
      return _i13.ChildBadge.fromJson(data) as T;
    }
    if (t == _i14.ChildProfile) {
      return _i14.ChildProfile.fromJson(data) as T;
    }
    if (t == _i15.Devotional) {
      return _i15.Devotional.fromJson(data) as T;
    }
    if (t == _i16.DevotionalTranslation) {
      return _i16.DevotionalTranslation.fromJson(data) as T;
    }
    if (t == _i17.DownloadAsset) {
      return _i17.DownloadAsset.fromJson(data) as T;
    }
    if (t == _i18.DownloadBundle) {
      return _i18.DownloadBundle.fromJson(data) as T;
    }
    if (t == _i19.DownloadRecord) {
      return _i19.DownloadRecord.fromJson(data) as T;
    }
    if (t == _i20.Greeting) {
      return _i20.Greeting.fromJson(data) as T;
    }
    if (t == _i21.Page) {
      return _i21.Page.fromJson(data) as T;
    }
    if (t == _i22.PageContent) {
      return _i22.PageContent.fromJson(data) as T;
    }
    if (t == _i23.ReadingProgress) {
      return _i23.ReadingProgress.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AgeBracket?>()) {
      return (data != null ? _i2.AgeBracket.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AppLanguage?>()) {
      return (data != null ? _i3.AppLanguage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AppUser?>()) {
      return (data != null ? _i4.AppUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthResponse?>()) {
      return (data != null ? _i5.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Badge?>()) {
      return (data != null ? _i6.Badge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Book?>()) {
      return (data != null ? _i7.Book.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.BookCategory?>()) {
      return (data != null ? _i8.BookCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.BookDetail?>()) {
      return (data != null ? _i9.BookDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.BookPage?>()) {
      return (data != null ? _i10.BookPage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.BookSummary?>()) {
      return (data != null ? _i11.BookSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.BookTranslation?>()) {
      return (data != null ? _i12.BookTranslation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ChildBadge?>()) {
      return (data != null ? _i13.ChildBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ChildProfile?>()) {
      return (data != null ? _i14.ChildProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Devotional?>()) {
      return (data != null ? _i15.Devotional.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.DevotionalTranslation?>()) {
      return (data != null ? _i16.DevotionalTranslation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.DownloadAsset?>()) {
      return (data != null ? _i17.DownloadAsset.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.DownloadBundle?>()) {
      return (data != null ? _i18.DownloadBundle.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.DownloadRecord?>()) {
      return (data != null ? _i19.DownloadRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Greeting?>()) {
      return (data != null ? _i20.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Page?>()) {
      return (data != null ? _i21.Page.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PageContent?>()) {
      return (data != null ? _i22.PageContent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.ReadingProgress?>()) {
      return (data != null ? _i23.ReadingProgress.fromJson(data) : null) as T;
    }
    if (t == List<_i10.BookPage>) {
      return (data as List).map((e) => deserialize<_i10.BookPage>(e)).toList()
          as T;
    }
    if (t == List<_i17.DownloadAsset>) {
      return (data as List)
              .map((e) => deserialize<_i17.DownloadAsset>(e))
              .toList()
          as T;
    }
    if (t == List<_i24.ChildProfile>) {
      return (data as List)
              .map((e) => deserialize<_i24.ChildProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_i25.BookSummary>) {
      return (data as List)
              .map((e) => deserialize<_i25.BookSummary>(e))
              .toList()
          as T;
    }
    try {
      return _i26.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i27.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AgeBracket => 'AgeBracket',
      _i3.AppLanguage => 'AppLanguage',
      _i4.AppUser => 'AppUser',
      _i5.AuthResponse => 'AuthResponse',
      _i6.Badge => 'Badge',
      _i7.Book => 'Book',
      _i8.BookCategory => 'BookCategory',
      _i9.BookDetail => 'BookDetail',
      _i10.BookPage => 'BookPage',
      _i11.BookSummary => 'BookSummary',
      _i12.BookTranslation => 'BookTranslation',
      _i13.ChildBadge => 'ChildBadge',
      _i14.ChildProfile => 'ChildProfile',
      _i15.Devotional => 'Devotional',
      _i16.DevotionalTranslation => 'DevotionalTranslation',
      _i17.DownloadAsset => 'DownloadAsset',
      _i18.DownloadBundle => 'DownloadBundle',
      _i19.DownloadRecord => 'DownloadRecord',
      _i20.Greeting => 'Greeting',
      _i21.Page => 'Page',
      _i22.PageContent => 'PageContent',
      _i23.ReadingProgress => 'ReadingProgress',
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
      case _i2.AgeBracket():
        return 'AgeBracket';
      case _i3.AppLanguage():
        return 'AppLanguage';
      case _i4.AppUser():
        return 'AppUser';
      case _i5.AuthResponse():
        return 'AuthResponse';
      case _i6.Badge():
        return 'Badge';
      case _i7.Book():
        return 'Book';
      case _i8.BookCategory():
        return 'BookCategory';
      case _i9.BookDetail():
        return 'BookDetail';
      case _i10.BookPage():
        return 'BookPage';
      case _i11.BookSummary():
        return 'BookSummary';
      case _i12.BookTranslation():
        return 'BookTranslation';
      case _i13.ChildBadge():
        return 'ChildBadge';
      case _i14.ChildProfile():
        return 'ChildProfile';
      case _i15.Devotional():
        return 'Devotional';
      case _i16.DevotionalTranslation():
        return 'DevotionalTranslation';
      case _i17.DownloadAsset():
        return 'DownloadAsset';
      case _i18.DownloadBundle():
        return 'DownloadBundle';
      case _i19.DownloadRecord():
        return 'DownloadRecord';
      case _i20.Greeting():
        return 'Greeting';
      case _i21.Page():
        return 'Page';
      case _i22.PageContent():
        return 'PageContent';
      case _i23.ReadingProgress():
        return 'ReadingProgress';
    }
    className = _i26.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _i27.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'AgeBracket') {
      return deserialize<_i2.AgeBracket>(data['data']);
    }
    if (dataClassName == 'AppLanguage') {
      return deserialize<_i3.AppLanguage>(data['data']);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i4.AppUser>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i5.AuthResponse>(data['data']);
    }
    if (dataClassName == 'Badge') {
      return deserialize<_i6.Badge>(data['data']);
    }
    if (dataClassName == 'Book') {
      return deserialize<_i7.Book>(data['data']);
    }
    if (dataClassName == 'BookCategory') {
      return deserialize<_i8.BookCategory>(data['data']);
    }
    if (dataClassName == 'BookDetail') {
      return deserialize<_i9.BookDetail>(data['data']);
    }
    if (dataClassName == 'BookPage') {
      return deserialize<_i10.BookPage>(data['data']);
    }
    if (dataClassName == 'BookSummary') {
      return deserialize<_i11.BookSummary>(data['data']);
    }
    if (dataClassName == 'BookTranslation') {
      return deserialize<_i12.BookTranslation>(data['data']);
    }
    if (dataClassName == 'ChildBadge') {
      return deserialize<_i13.ChildBadge>(data['data']);
    }
    if (dataClassName == 'ChildProfile') {
      return deserialize<_i14.ChildProfile>(data['data']);
    }
    if (dataClassName == 'Devotional') {
      return deserialize<_i15.Devotional>(data['data']);
    }
    if (dataClassName == 'DevotionalTranslation') {
      return deserialize<_i16.DevotionalTranslation>(data['data']);
    }
    if (dataClassName == 'DownloadAsset') {
      return deserialize<_i17.DownloadAsset>(data['data']);
    }
    if (dataClassName == 'DownloadBundle') {
      return deserialize<_i18.DownloadBundle>(data['data']);
    }
    if (dataClassName == 'DownloadRecord') {
      return deserialize<_i19.DownloadRecord>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i20.Greeting>(data['data']);
    }
    if (dataClassName == 'Page') {
      return deserialize<_i21.Page>(data['data']);
    }
    if (dataClassName == 'PageContent') {
      return deserialize<_i22.PageContent>(data['data']);
    }
    if (dataClassName == 'ReadingProgress') {
      return deserialize<_i23.ReadingProgress>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i26.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i27.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _i26.Protocol().registerHostProtocol('kingdom_kids', this);
    _i27.Protocol().registerHostProtocol('kingdom_kids', this);
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
      return _i26.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i27.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
