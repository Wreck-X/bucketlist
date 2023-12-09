import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'session_token', value: token);
  }

  Future<String?> getToken() async {
    return _storage.read(key: 'session_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'session_token');
  }
}
