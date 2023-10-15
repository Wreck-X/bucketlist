import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class ApiService {
  final String baseUrl;
  Map<String, String> cookies = {};

  ApiService({required this.baseUrl});

  Future<int> Post(String url, Map<String, dynamic> data) async {
    final response = await http.get(Uri.parse(baseUrl));
    final cookies = response.headers['set-cookie'];
    final csrfToken = cookies!
        .split(';')
        .firstWhere((cookie) => cookie.startsWith('csrftoken='),
            orElse: () => '')
        .split('=')[1];

    final postResponse = await http.post(
      Uri.parse('$baseUrl$url'),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': csrfToken,
      },
      body: jsonEncode(data),
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('great success: ${response.body}');
      Map<String, dynamic> responseBody = jsonDecode(response.body);

      final session_token = responseBody['session_key'];
      await token.storeToken(session_token);
      return 0;
    } else {
      print('Failure: ${response.statusCode}');
      return 1;
    }
  }
}
