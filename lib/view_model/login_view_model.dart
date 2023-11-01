import '../utils/constants.dart';

Future<bool> login(String email, String password) async {
  // login shenanigans here
  var response = api.post('login/', {'email': email, 'password': password});
  return response;
}
