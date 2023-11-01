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
