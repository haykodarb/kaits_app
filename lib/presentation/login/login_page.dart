import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/text_field.dart';
import 'package:kaits_app/presentation/login/login_controller.dart';
import 'package:kaits_app/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController loginController = LoginController();

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: loginController.loginButtonCallback,
      child: const Text(
        'Login',
      ),
    );
  }

  Widget _loginForm() {
    final BuildContext context = Get.context!;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  callback: loginController.onUsernameChange,
                  label: 'Username',
                  isPassword: false,
                ),
                CustomTextField(
                  callback: loginController.onPasswordChange,
                  label: 'Password',
                  isPassword: true,
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              loginController.errorMessage.value,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _loginButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: loginController,
      builder: (LoginController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 50,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: _loginForm(),
            ),
          ),
        );
      },
    );
  }
}
