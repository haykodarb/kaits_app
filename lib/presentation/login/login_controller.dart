import 'package:get/get.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/login_form.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/routes.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final Rx<LoginForm> form = LoginForm(
    username: '',
    password: '',
  ).obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter something.';
    }

    if (value.length < 6) {
      return 'Username must be at least 6 characters long';
    }

    if (!isAscii(value)) {
      return 'Username should only include ASCII characters';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter something.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    if (!isAscii(value)) {
      return 'Password should only include ASCII characters';
    }

    return null;
  }

  Future<void> loginButtonCallback() async {
    if (formKey.currentState!.validate()) {
      final BackendReponse response =
          await LoginBackend.login(form: form.value);

      if (response.success) {
        errorMessage.value = '';
        Get.offAllNamed(RouteNames.dashboardPage);
        // Save token in memory
      } else {
        errorMessage.value = response.payload;
      }
    }
  }
}
