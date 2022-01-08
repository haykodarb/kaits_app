import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kaits_app/backend/constants.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/register_form.dart';

class RegisterBackend {
  static Future<BackendReponse> register({required RegisterForm form}) async {
    const String authority = BackendConstants.authority;

    const String route = '/api/register';

    final Uri url = Uri.http(authority, route);

    print(jsonEncode(form.toMap()));

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
