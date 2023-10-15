import 'package:http/http.dart' as http;
import 'dart:convert';

Future<int> sendPostRequest(
    String url, String username, String password) async {
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );
  print(response.body);

  if (response.statusCode == 200) {
    print('great success: ${response.body}');
    return 0;
  } else {
    print('Failure: ${response.statusCode}');
    return 1;
  }
}
