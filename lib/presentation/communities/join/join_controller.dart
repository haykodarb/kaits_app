import 'package:get/get.dart';
import 'package:kaits_app/backend/communities_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/community.dart';
import 'package:kaits_app/presentation/communities/communities_controller.dart';
import 'package:kaits_app/routes.dart';
import 'package:flutter/material.dart';

class CreateCommunityController extends GetxController {
  final CommunitiesController _communitiesController = Get.find();

  final Rx<CommunityForm> form = CommunityForm(
    name: '',
    description: '',
  ).obs;

  final RxString errorMessage = ''.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter something.';
    }

    if (value.length < 6) {
      return 'Name must be at least 6 characters long';
    }

    return null;
  }

  String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter something.';
    }

    if (value.length < 20) {
      return 'Description must be at least 20 characters long';
    }

    return null;
  }

  void onNameChange(String value) {
    formKey.currentState!.validate();
    form.update((val) {
      val!.name = value;
    });
  }

  void onDescriptionChange(String value) {
    formKey.currentState!.validate();
    form.update((val) {
      val!.description = value;
    });
  }

  Future<void> onSubmitButton() async {
    errorMessage.value = '';

    if (formKey.currentState!.validate()) {
      final BackendReponse response = await CommunitiesBackend.register(
        form: form.value,
      );

      if (response.success) {
        _communitiesController.getCommunitiesForUser();
        Get.offAllNamed(RouteNames.communitiesPage);
      } else {
        errorMessage.value = response.payload;
      }
    }
  }
}
