import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/text_field.dart';
import 'package:kaits_app/presentation/register/register_controller.dart';
import 'package:kaits_app/routes.dart';
import 'dart:io' show Platform;

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  Widget _registerForm() {
    BuildContext context = Get.context!;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 400, maxWidth: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextField(
            callback: (String value) {},
            label: 'First name',
            isPassword: false,
          ),
          CustomTextField(
            callback: (String value) {},
            label: 'Username',
            isPassword: false,
          ),
          CustomTextField(
            callback: (String value) {},
            label: 'Password',
            isPassword: true,
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(RouteNames.dashboardPage);
            },
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      builder: (RegisterController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 50,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: _registerForm(),
            ),
          ),
        );
      },
    );
  }
}
