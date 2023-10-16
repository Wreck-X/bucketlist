import '../utils/constants.dart';
import '../services/authentication.dart';

Future<void> login(String email, String password) async {
  // login shenanigans here
  api.Post('login/', {'email': email, 'password': password});
  // Store the token
}
