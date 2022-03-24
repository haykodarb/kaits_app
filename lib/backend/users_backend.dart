import 'package:http/http.dart' as http;
import 'package:kaits_app/backend/constants.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/community.dart';
import 'package:kaits_app/models/user.dart';

class UsersBackend {
  static Future<BackendReponse> searchUsers({
    required String query,
    required Community community,
  }) async {
    const String _authority = BackendConstants.authority;

    const String _route = '/api/users/search';

    final String? _token = await LoginBackend.getAuthToken() ?? '';

    final Uri _url = Uri.http(_authority, _route, {
      "query": query,
      "communityId": community.id,
    });

    http.Response response = await http.get(
      _url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $_token',
      },
    );

    List<User>? _listOfUsers = User.listFromResponseBody(
      response.body,
    );

    final BackendReponse parsedResponse = BackendReponse(
      success: response.statusCode == 200 && _listOfUsers != null,
      payload: _listOfUsers,
    );

    return parsedResponse;
  }
}
