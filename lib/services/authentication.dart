import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class ApiService {
  final String baseUrl;

  final JsonDecoder _decoder = new JsonDecoder();
  final JsonEncoder _encoder = new JsonEncoder();

  Map<String, String> headers = {"Content-Type": "application/json"};
  Map<String, String> cookies = {};

  ApiService({required this.baseUrl}) {
    if (cookies.isEmpty) {
      _fetchBaseCookies();
    }
  }

  Future<void> _fetchBaseCookies() async {
    final response = await http.get(Uri.parse(baseUrl));
    _updateCookie(response);
    csrf_token.storeToken(cookies['csrftoken']!);
  }

  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
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
          csrf_token.storeToken(this.cookies['csrftoken']!);
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
    String? token = await csrf_token.getToken();
    if (token != null) {
      print(sessionKey);
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

      if (statusCode < 200 || statusCode > 400 || json == null) {
        print("Error while fetching data");
        return false;
      }
      print("POST /login");
      if (json.decode(response.body)['status'] == "success") {
        print("we're in");
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return true;
      }
      //print(response.body);
      return false;
    });
  }

  Future<String> get(String url) async {
    String? sessionKey = await session_token.getToken();
    String? token = await csrf_token.getToken();
    if (token != null) {
      print(sessionKey);
      headers['X-CSRFToken'] = token;
      headers['Authorization'] = sessionKey!;
    }
    return http
        .get(Uri.parse("$baseUrl$url"), headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        print("Error while fetching data");
        return res;
      }
      print("POST /login");
      if (json.decode(response.body)['status'] == "success") {
        print(res);
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return res;
      }
      //print(response.body);
      return res;
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
