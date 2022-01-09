import 'package:http/http.dart' as http;
import 'package:kaits_app/backend/constants.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/book.dart';

class BooksBackend {
  static Future<BackendReponse> getAllBooks() async {
    const String authority = BackendConstants.authority;

    const String route = '/api/books';

    final String? token = await LoginBackend.getAuthToken() ?? '';

    final Uri url = Uri.http(authority, route);

    http.Response stringResponse = await http.get(
      url,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer $token',
      },
    );

    final BackendReponse response = BackendReponse.fromBody(
      stringResponse.body,
    );

    if (response.success && (response.payload as List<dynamic>).isNotEmpty) {
      response.payload = Book.getListOfBooks(
        response.payload as List<dynamic>,
      );
    }

    return response;
  }
}
