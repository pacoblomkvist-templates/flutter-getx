import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  final _storage = const FlutterSecureStorage();
  Future<String?> getToken() async {
    await _storage.read(key: "token");
  }

  Future setToken(String token) async {
    await _storage.write(key: "token", value: token);
  }
}
