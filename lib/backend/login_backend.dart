import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kaits_app/backend/constants.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/login_form.dart';
import 'package:hive/hive.dart';

class LoginBackend {
  static Future<BackendReponse> login({required LoginForm form}) async {
    const String authority = BackendConstants.authority;

    const String route = '/api/login';

    final Uri url = Uri.http(authority, route);

    http.Response response = await http.post(
      url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        form.toMap(),
      ),
    );

    final BackendReponse parsedResponse = BackendReponse.fromBody(
      response.body,
    );

    return parsedResponse;
  }

  static Future<bool> storeAuthToken({
    required String token,
  }) async {
    try {
      final Box _hiveBox = await Hive.openBox(BackendConstants.hiveBox);

      await _hiveBox.put(BackendConstants.authTokenKey, token);

      return _hiveBox.containsKey(BackendConstants.authTokenKey);
    } catch (e) {
      return false;
    }
  }

  static Future<String?> getAuthToken() async {
    try {
      final Box _hiveBox = await Hive.openBox(BackendConstants.hiveBox);

      if (_hiveBox.containsKey(BackendConstants.authTokenKey)) {
        return _hiveBox.get(BackendConstants.authTokenKey) as String;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> removeAuthToken() async {
    try {
      final Box _hiveBox = await Hive.openBox(BackendConstants.hiveBox);

      await _hiveBox.delete(BackendConstants.authTokenKey);

      return !_hiveBox.containsKey(BackendConstants.authTokenKey);
    } catch (e) {
      return false;
    }
  }
}
