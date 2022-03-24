import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaits_app/backend/constants.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/community.dart';
import 'package:kaits_app/models/user.dart';

class CommunitiesBackend {
  static Future<BackendReponse> register({required CommunityForm form}) async {
    const String _authority = BackendConstants.authority;

    const String _route = '/api/communities';

    final String? _token = await LoginBackend.getAuthToken() ?? '';

    final Uri _url = Uri.http(_authority, _route);

    http.Response response = await http.post(
      _url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode(
        form.toMap(),
      ),
    );

    final BackendReponse parsedResponse = BackendReponse(
      success: response.statusCode == 200,
      payload: response.body,
    );

    return parsedResponse;
  }

  static Future<BackendReponse> getAdminCommunitiesForUser() async {
    const String _authority = BackendConstants.authority;

    const String _route = '/api/communities/admin';

    final String? _token = await LoginBackend.getAuthToken() ?? '';

    final Uri _url = Uri.http(_authority, _route);

    http.Response response = await http.get(
      _url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $_token',
      },
    );

    List<Community>? _listOfCommunities =
        Community.listFromResponseBody(response.body);

    final BackendReponse parsedResponse = BackendReponse(
      success: response.statusCode == 200 && _listOfCommunities != null,
      payload: _listOfCommunities,
    );

    return parsedResponse;
  }

  static Future<BackendReponse> getCommunitiesForUser() async {
    const String _authority = BackendConstants.authority;

    const String _route = '/api/communities';

    final String? _token = await LoginBackend.getAuthToken() ?? '';

    final Uri _url = Uri.http(_authority, _route);

    http.Response response = await http.get(
      _url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $_token',
      },
    );

    List<Community>? _listOfCommunities =
        Community.listFromResponseBody(response.body);

    final BackendReponse parsedResponse = BackendReponse(
      success: response.statusCode == 200 && _listOfCommunities != null,
      payload: _listOfCommunities,
    );

    return parsedResponse;
  }

  static Future<BackendReponse> getUsersInCommunity(Community community) async {
    const String _authority = BackendConstants.authority;

    const String _route = '/api/communities/users';

    final String? _token = await LoginBackend.getAuthToken() ?? '';

    final Uri _url = Uri.http(_authority, _route, {
      "communityId": community.id,
    });

    http.Response response = await http.get(
      _url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode != 200) {
      return BackendReponse(success: false, payload: "Server error.");
    }

    List<User>? users = User.listFromResponseBody(response.body);

    if (users == null) {
      return BackendReponse(success: false, payload: "Community is empty");
    }

    return BackendReponse(success: true, payload: users);
  }
}
