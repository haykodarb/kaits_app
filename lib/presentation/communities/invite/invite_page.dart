import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/models/user.dart';
import 'package:kaits_app/presentation/communities/invite/invite_controller.dart';

class InviteCommunityPage extends StatelessWidget {
  InviteCommunityPage({Key? key}) : super(key: key);

  final InviteController _inviteController = InviteController();

  Widget _userButton(User user) {
    final BuildContext context = Get.context!;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(
          left: 20,
        ),
        fixedSize: const Size.fromHeight(50),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {
        print(user.id);
        print(user.username);
      },
      child: Text(
        user.username,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
      ),
    );
  }

  Widget _searchForm() {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            label: Text(
              'Search users...',
            ),
          ),
          onChanged: _inviteController.onQueryChanged,
        ),
        SizedBox(
          width: double.maxFinite,
          height: 200,
          child: Obx(() {
            return ListView.builder(
              itemCount: _inviteController.listOfUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return _userButton(
                  _inviteController.listOfUsers[index],
                );
              },
            );
          }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _inviteController,
      builder: (InviteController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.only(
              top: 75,
              right: 35,
              left: 35,
            ),
            child: _searchForm(),
          ),
        );
      },
    );
  }
}
