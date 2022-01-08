import 'package:get/get.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/login_form.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/routes.dart';

class LoginController extends GetxController {
  final Rx<LoginForm> form = LoginForm(username: '', password: '').obs;
  final RxString errorMessage = ''.obs;

  void onUsernameChange(String value) {
    form.update((val) {
      val!.username = value;
    });
  }

  void onPasswordChange(String value) {
    form.update((val) {
      val!.password = value;
    });
  }

  Future<void> loginButtonCallback() async {
    final BackendReponse response = await LoginBackend.login(form: form.value);

    if (response.success) {
      errorMessage.value = '';
      Get.offAllNamed(RouteNames.dashboardPage);
      // Save token in memory
    } else {
      errorMessage.value = response.payload;
    }
  }
}
