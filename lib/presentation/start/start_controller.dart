import 'package:get/get.dart';
import 'package:kaits_app/routes.dart';

class StartController extends GetxController {
  void loginButtonCallback() {
    Get.toNamed(RouteNames.loginPage);
  }

  void registerButtonCallback() {
    Get.toNamed(RouteNames.registerPage);
  }
}
