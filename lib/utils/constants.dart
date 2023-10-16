import '../models/session_token.dart';
import '../services/authentication.dart';

TokenStorage csrf_token = TokenStorage();
String base_url = 'http://127.0.0.1:8000/';
ApiService api = ApiService(baseUrl: base_url);
