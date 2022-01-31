import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/text_field.dart';
import 'package:kaits_app/presentation/communities/create/create_community_controller.dart';

class CreateCommunityPage extends StatelessWidget {
  CreateCommunityPage({Key? key}) : super(key: key);

  final CreateCommunityController _createCommunityController =
      CreateCommunityController();

  Widget _communityForm() {
    final BuildContext context = Get.context!;

    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        const Size.fromHeight(600),
      ),
      child: Form(
        key: _createCommunityController.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
              validator: _createCommunityController.nameValidator,
              callback: _createCommunityController.onNameChange,
              label: 'Name',
              isPassword: false,
            ),
            CustomTextField(
              validator: _createCommunityController.descriptionValidator,
              callback: _createCommunityController.onDescriptionChange,
              label: 'Description',
              isPassword: false,
            ),
            SizedBox(
              height: 70,
              child: Obx(
                () => Text(
                  _createCommunityController.errorMessage.value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _createCommunityController.onSubmitButton,
              child: const Text('Create Community'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _createCommunityController,
      builder: (CreateCommunityController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 75,
              right: 50,
              left: 50,
            ),
            child: _communityForm(),
          ),
        );
      },
    );
  }
}
