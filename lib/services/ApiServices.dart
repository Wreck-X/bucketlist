import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/constants.dart';

class OrgStat {
  late String open;
  late String overdue;
  late String inprogress;
}

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
        debugPrint("we're in");
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
      debugPrint("POST");
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
    OrgStat orgStat = OrgStat();
    String? sessionKey = await session_token.getToken();
    String? token = await csrf_token.getToken();
    if (token != null) {
      debugPrint("-");
      debugPrint(org);
      debugPrint("-");
      headers['X-CSRFToken'] = token;
      headers['Authorization'] = sessionKey!;
      headers['org'] = org;
      print(org);
    }
    return http
        .get(Uri.parse("$baseUrl$url"), headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      _updateCookie(response);

      if (statusCode < 200 || statusCode > 400) {
        debugPrint("Error while fetching data");
        return {"Error code": statusCode};
      } else {
        Map<String, dynamic> responseBody = json.decode(res);
        print(responseBody['projects']);
        return responseBody;
      }
    });
  }

  Future<List<dynamic>> get_updates(String url) async {
    String? sessionKey = await session_token.getToken();
    String? token = await csrf_token.getToken();
    if (token != null) {
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
        return [];
      }
      if (statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(res);
        print(responseBody['status_update'].runtimeType);
        return responseBody['status_update'];
      }

      if (json.decode(response.body) == "success") {
        session_token.storeToken(json.decode(response.body)["session_token"]);
        return [];
      }
      // print(response.body);
      return [];
    });
  }

  Future<List<dynamic>> get_members(String url) async {
    String? sessionKey = await session_token.getToken();
    String? token = await csrf_token.getToken();
    if (token != null) {
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
        return [];
      }
      if (statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(res);
        print(responseBody['members'].runtimeType);
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

  Future<dynamic> refresh_cookies() async {
    try {
      api._fetchBaseCookies();
      return 0;
    } catch (e) {
      return 1;
    }
  }
}
