import 'package:get/get.dart';
import 'package:kaits_app/backend/register_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/register_form.dart';
import 'package:kaits_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class RegisterController extends GetxController {
  final Rx<RegisterForm> form = RegisterForm(
    username: '',
    password: '',
    name: '',
  ).obs;

  final RxString errorMessage = ''.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter something.';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }

    return null;
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

  void onUsernameChange(String value) {
    formKey.currentState!.validate();
    form.update((val) {
      val!.username = value;
    });
  }

  void onNameChange(String value) {
    formKey.currentState!.validate();
    form.update((val) {
      val!.name = value;
    });
  }

  void onPasswordChange(String value) {
    formKey.currentState!.validate();
    form.update((val) {
      val!.password = value;
    });
  }

  Future<void> onSubmitButton() async {
    if (formKey.currentState!.validate()) {
      print('Validation correct!');

      final BackendReponse response = await RegisterBackend.register(
        form: form.value,
      );

      if (response.success) {
        Get.offAllNamed(RouteNames.startPage);
      } else {
        errorMessage.value = response.payload;
      }
    }
  }
}
