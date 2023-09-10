import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SaveDetails {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static Future writeSaveDetails(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String> readSaveDetails(String key) async {
    return await storage.read(key: key) ?? "no data found";
  }
}
