import '../utils/constants.dart';
import '../services/authentication.dart';

Future<void> login(String username, String password) async {
  // login shenanigans here
  api.Post('login/', {'username': username, 'password': password});
  // Store the token
}
