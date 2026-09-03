import 'package:serverpod/serverpod.dart';

class AssetUrlService {
  // TODO: Replace public URLs with expiring SigV4 download URLs when R2 support is added.
  static Future<String> publicUrl(Session session, String assetPath) async {
    final url = await session.storage.getPublicUrl(
      storageId: 'public',
      path: assetPath,
    );
    if (url == null) {
      throw StateError('Public R2 asset not found: $assetPath');
    }
    return url.toString();
  }

  static Future<String?> nullablePublicUrl(
    Session session,
    String? assetPath,
  ) async {
    if (assetPath == null) return null;
    return publicUrl(session, assetPath);
  }
}
