import 'dart:convert';

class BackendReponse {
  bool success = false;
  String payload = '';

  BackendReponse.fromBody(String body) {
    Map<String, dynamic> parsedBody = jsonDecode(body);
    success = parsedBody['success'];
    payload = parsedBody['payload'];
  }
}
