import '../utils/constants.dart';
import '../services/authentication.dart';

Future<void> login(String username, String password) async {
  // login shenanigans here
  sendPostRequest(loginurl, username, password);
  print("succesful login");
  // Store the token
  await token.storeToken('Lemon');
}
