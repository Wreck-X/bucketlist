import 'package:flutter/foundation.dart';
import '../models/session_token.dart';

class TokenViewModel with ChangeNotifier {
  final TokenStorage _tokenService;
  String? _token;

  TokenViewModel(this._tokenService);

  String? get token => _token;

  Future<void> setToken(String newToken) async {
    await _tokenService.storeToken(newToken);
    _token = newToken;
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = await _tokenService.getToken();
    notifyListeners();
  }
}
