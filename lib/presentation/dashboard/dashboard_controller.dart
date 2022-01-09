import 'package:get/get.dart';
import 'package:kaits_app/backend/books_backend.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/book.dart';
import 'package:kaits_app/routes.dart';

class DashboardController extends GetxController {
  RxList<Book> loadedBooks = <Book>[].obs;

  Future<void> handleLogout() async {
    await LoginBackend.removeAuthToken();
    Get.offAllNamed(RouteNames.startPage);
  }

  Future<void> loadAllBooks() async {
    final BackendReponse response = await BooksBackend.getAllBooks();

    if (response.success) {
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
      loadedBooks.addAll(response.payload);
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadAllBooks();
  }
}
