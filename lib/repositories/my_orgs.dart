import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../utils/utils.dart';

class DataRepository {
  Future<List> fetchData() async {
    try {
      List org = Utils.stringToList(await api.get('orgs/'));
      print(org);
      servers = org;
      return servers;
    } catch (e) {
      return [];
    }
  }
}
