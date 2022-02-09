import 'package:get/get.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/models/book.dart';
import 'package:kaits_app/routes.dart';

class DashboardController extends GetxController {
  RxList<Book> loadedBooks = <Book>[].obs;

  Future<void> handleLogout() async {
    await LoginBackend.removeAuthToken();
    Get.offAllNamed(RouteNames.startPage);
  }
}
