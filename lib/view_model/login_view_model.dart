import '../utils/constants.dart';

Future<bool> login(String email, String password) async {
  var response = api.post('login/', {'email': email, 'password': password});
  return response;
}

Future<List<dynamic>> getupdates() async {
  var response = await api.get_updates('updates/');
  return response;
}

Future<List<dynamic>> getmembers() async {
  var response = await api.get_members('members/');
  print(response);
  return response;
}

Future<Map<String, dynamic>> getprojects(String org_uid, String type) async {
  try {
    final response = await api.get_projects('projects/', org_uid, type);
    return response;
  } catch (e) {
    print("Error parsing response: $e");
    return {"error ": e};
  }
}

Future<String> postboolstate(bool state, String keys) async {
  var response = api.post_boolstate('check_project/', state, keys);
  return response;
}

Future<String> posttaskboolstate(bool state, String key1, int key2) async {
  var response = api.post_taskboolstate('check_task/', state, key1, key2);
  return response;
}
//post_boolstate for checkboxes and visibility here
