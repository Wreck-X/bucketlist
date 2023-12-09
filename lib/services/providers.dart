import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';
import '../utils/constants.dart';
import '../models/statusUpdates/statusUpdates.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<StatusUpdates> statusupdates(ref) async {
  final response = await http.get(Uri.http(base_url, '/updates'));

  final json = jsonDecode(response.body) as Map<String, dynamic>;
  print(json);
  return StatusUpdates.fromJson(json);
}


// final updatesProvider = Provider((ref) => "$base_url/updates/");
// final membersProvider = Provider((ref) => "$base_url/members/");
// final projectsProvider = Provider((ref) => "$base_url/projects/");

// final updatesResponseProvider = Provider.autoDispose(
//   (ref) async {
//     try {
//       Map<String, String> headers = {"Content-Type": "application/json"};
//       final sessionKey = session_token.getToken();
//       final csrfToken = CSRF_TOKEN.getToken();

//       headers['X-CSRFToken'] = csrfToken as String;
//       headers['session_token'] = sessionKey as String;

//       final apiUrl = ref.read(updatesProvider);
//       final response = await http.get(Uri.parse(apiUrl)).then(
//         (http.Response response) {
//           final String body = response.body;
//           final int statusCode = response.statusCode;
//           if (statusCode < 200 || statusCode > 400) {
//             throw Exception("Failed to load data. Status code: $statusCode");
//           } else {
//             Map<String, dynamic> responseBody = json.decode(body);
//             return responseBody;
//           }
//         },
//       );
//     } catch (error) {
//       throw Exception("Failed to load data, Error $error");
//     }
//   },
// );  

// Future<Map<String, dynamic>> get_projects(
//     String url, String org, String type) async {
//   String? sessionKey = await session_token.getToken();
//   String? token = await CSRF_TOKEN.getToken();
//   if (token != null) {
//     debugPrint(sessionKey);
//     headers['X-CSRFToken'] = token;
//     headers['Authorization'] = sessionKey!;
//     headers['org'] = org;
//   }
//   return http
//       .get(Uri.parse("$baseUrl$url"), headers: headers)
//       .then((http.Response response) {
//     final String res = response.body;
//     final int statusCode = response.statusCode;
//     if (statusCode < 200 || statusCode > 400) {
//       debugPrint("Error while fetching data $statusCode");
//       return {"Error code": statusCode};
//     } else {
//       Map<String, dynamic> responseBody = json.decode(res);
//       return responseBody;
//     }
//   });
// }
