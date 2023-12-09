import 'dart:async';

import 'package:http/http.dart' as http;

Future<List<StatusList>> fetchallstatus() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/'));
  if (response.statusCode == 200) {
    final List<dynamic> data = response.body as List<dynamic>;
    List<StatusList> objects =
        data.map((json) => StatusList.fromJson(json)).toList();

    return objects;
  } else {
    throw Exception('Failed to load album');
  }
}

class StatusList {
  final String user;
  final List<String> updates;

  StatusList({
    required this.user,
    required this.updates,
  });

  factory StatusList.fromJson(Map<String, dynamic> json) {
    return StatusList(
      user: json['user'] as String,
      updates: List<String>.from(json['updatelist'] as List<dynamic>),
    );
  }
}
