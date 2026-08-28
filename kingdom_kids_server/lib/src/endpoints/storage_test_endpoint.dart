import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';

class StorageTestEndpoint extends Endpoint {
  Future<String> testUpload(Session session) async {
    final bytes = ByteData.sublistView(
      Uint8List.fromList('hello r2'.codeUnits),
    );

    await session.storage.storeFile(
      storageId: 'public',
      path: 'test/hello.txt',
      byteData: bytes,
    );

    return 'Upload réussi vers R2 !';
  }
}