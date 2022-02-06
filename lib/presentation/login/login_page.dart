import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/text_field.dart';
import 'package:kaits_app/presentation/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _loginController = LoginController();

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: _loginController.loginButtonCallback,
      child: const Text(
        'Login',
      ),
    );
  }

  Widget _loginForm() {
    final BuildContext context = Get.context!;

    return Form(
      key: _loginController.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextField(
            validator: _loginController.usernameValidator,
            callback: _loginController.onUsernameChange,
            label: 'Username',
          ),
          CustomTextField(
            validator: _loginController.passwordValidator,
            callback: _loginController.onPasswordChange,
            label: 'Password',
            isPassword: true,
          ),
          SizedBox(
            height: 70,
            child: Obx(
              () => Text(
                _loginController.errorMessage.value,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w500,
                ),
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
      init: _loginController,
      builder: (LoginController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 75,
              right: 50,
              left: 50,
            ),
            child: _loginForm(),
          ),
        );
      },
    );
  }
}
