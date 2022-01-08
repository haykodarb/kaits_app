import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kaits_app/backend/constants.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/login_form.dart';

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
}
