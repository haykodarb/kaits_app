import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/communities/create/create_community_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinCommunityPage extends StatelessWidget {
  JoinCommunityPage({Key? key}) : super(key: key);

  final CreateCommunityController _createCommunityController =
      CreateCommunityController();

  Widget _joinCodeInput() {
    final BuildContext context = Get.context!;

    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        const Size.fromHeight(600),
      ),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        cursorColor: Theme.of(context).colorScheme.primaryVariant,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderWidth: 1,
          activeColor: Theme.of(context).colorScheme.primaryVariant,
          selectedColor: Theme.of(context).colorScheme.primaryVariant,
          inactiveColor: Theme.of(context).colorScheme.secondary,
        ),
        onCompleted: (String value) {
          print(value);
        },
        onChanged: (String newValue) {},
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
            child: _joinCodeInput(),
          ),
        );
      },
    );
  }
}
