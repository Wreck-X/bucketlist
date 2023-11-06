import 'dart:convert';

import 'package:flutter/material.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static List stringToList(String jsonString) {
    // Parse the JSON string into a Dart Map
    Map<String, dynamic> parsedMap = json.decode(jsonString);

    List<Map<String, dynamic>> list = parsedMap.entries.map((entry) {
      return {"id": entry.key, "name": entry.value["name"]};
    }).toList();

    return (list);
  }
}
List<Map<String, String>> parseResponse(String responseBody) {
  final parsed = json.decode(responseBody) as Map<String, dynamic>;
  return parsed.entries.map((entry) {
    return {
      'uid': entry.key,
      'name': entry.value['name'] as String,
    };
  }).toList();
}