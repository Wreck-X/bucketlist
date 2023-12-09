import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class ApiService {
  final String baseUrl;

  final JsonDecoder _decoder = new JsonDecoder();
  final JsonEncoder _encoder = new JsonEncoder();

  Map<String, String> headers = {"Content-Type": "application/json"};
  Map<String, String> cookies = {};

  //Constructor
  ApiService({required this.baseUrl}) {
    if (cookies.isEmpty) {
      _fetchBaseCookies();
    }
  }

  Future<void> _fetchBaseCookies() async {
    final response = await http.get(Uri.parse(baseUrl));
    _updateCookie(response);
    CSRF_TOKEN.storeToken(cookies['csrftoken'] ?? "");
  }

  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      print("coookiesss $allSetCookie");
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        this.cookies[key] = value;

        if (this.cookies.containsKey('csrftoken')) {
          CSRF_TOKEN.storeToken(this.cookies['csrftoken']!);
        }
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.length > 0) cookie += ";";
      cookie += "$key=${cookies[key]}";
    }

    return cookie;
  }

  Future<bool> post(String url, Map<String, dynamic> data) async {
    String? sessionKey = await session_token.getToken();
    String? token = await CSRF_TOKEN.getToken();
    if (token != null) {
      debugPrint(sessionKey);
      headers['X-CSRFToken'] = token;
      headers['session_token'] = sessionKey!;
    }
    return http
        .post(Uri.parse("$baseUrl$url"),
            body: _encoder.convert(data), headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400) {
        debugPrint("Error while fetching data");
        return false;
      }
      debugPrint("POST /login");
      if (json.decode(response.body)['status'] == "success") {
        debugPrint("Logged in");
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return true;
      }
      //print(response.body);
      return false;
    });
  }

  Future<String> get(String url) async {
    String? sessionKey = await session_token.getToken();
    String? token = await CSRF_TOKEN.getToken();
    if (token != null) {
      debugPrint(sessionKey);
      headers['X-CSRFToken'] = token;
      headers['Authorization'] = sessionKey!;
    }
    return http
        .get(Uri.parse("$baseUrl$url"), headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400) {
        debugPrint("Error while fetching data");
        return res;
      }
      if (json.decode(response.body)['status'] == "success") {
        debugPrint(res);
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return res;
      }
      //print(response.body);
      return res;
    });
  }

  Future<Map<String, dynamic>> get_projects(
      String url, String org, String type) async {
    String? sessionKey = await session_token.getToken();
    String? token = await CSRF_TOKEN.getToken();
    if (token != null) {
      debugPrint(sessionKey);
      headers['X-CSRFToken'] = token;
      headers['Authorization'] = sessionKey!;
      headers['org'] = org;
    }
    return http
        .get(Uri.parse("$baseUrl$url"), headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400) {
        debugPrint("Error while fetching data $statusCode");
        return {"Error code": statusCode};
      } else {
        Map<String, dynamic> responseBody = json.decode(res);
        return responseBody;
      }
    });
  }

  Future<List<dynamic>> get_members(String url) async {
    String? sessionKey = await session_token.getToken();
    String? token = await CSRF_TOKEN.getToken();
    if (token != null) {
      headers['X-CSRFToken'] = token;
      headers['Authorization'] = sessionKey!;
    }
    return http
        .get(Uri.parse("$baseUrl$url"), headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      print(res);
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400) {
        debugPrint("Error while fetching data");
        return [];
      }
      if (statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(res);
        return responseBody['members'];
      }

      if (json.decode(response.body) == "success") {
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return [];
      }
      // print(response.body);
      return [];
    });
  }

  Future<String> post_boolstate(String url, bool state, String keys) async {
    String? sessionKey = await session_token.getToken();
    String? token = await CSRF_TOKEN.getToken();
    Map<String, dynamic> requestBody;

    requestBody = {"state": state};

    String requestBodyJson = jsonEncode(requestBody);
    if (token != null) {
      headers['X-CSRFToken'] = token;
      headers['Authorization'] = sessionKey!;
      headers['proj'] = keys;
    }
    return http
        .post(Uri.parse("$baseUrl$url"),
            headers: headers, body: requestBodyJson)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400) {
        debugPrint("Error while fetching data");
        return '';
      }
      if (json.decode(response.body) == "success") {
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return '';
      }
      // print(response.body);
      return '';
    });
  }

  Future<String> post_taskboolstate(
      String url, bool state, String key1, int key2) async {
    String? sessionKey = await session_token.getToken();
    String? token = await CSRF_TOKEN.getToken();
    Map<String, dynamic> requestBody;

    requestBody = {"state": state};

    String requestBodyJson = jsonEncode(requestBody);
    if (token != null) {
      headers['X-CSRFToken'] = token;
      headers['Authorization'] = sessionKey!;
      headers['proj'] = key1;
      headers['milestone-id'] = key2.toString();
    }
    return http
        .post(Uri.parse("$baseUrl$url"),
            headers: headers, body: requestBodyJson)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400) {
        debugPrint("Error while fetching data");
        return '';
      }
      if (json.decode(response.body) == "success") {
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return '';
      }
      // print(response.body);
      return '';
    });
  }

  Future<dynamic> refresh_cookies() async {
    try {
      api._fetchBaseCookies();
      return 0;
    } catch (e) {
      return 1;
    }
  }
}
