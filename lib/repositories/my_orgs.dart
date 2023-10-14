import 'dart:convert';
import 'package:http/http.dart' as http;

class DataRepository {
  final String _baseUrl = "https://django-beacon.vercel.app";

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse("$_baseUrl/orgs"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
