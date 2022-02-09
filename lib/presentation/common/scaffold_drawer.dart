import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/wrapper_scaffold/wrapper_scaffold_controller.dart';

enum DrawerButtons {
  home,
  communities,
  logout,
}

class ScaffoldDrawer extends StatelessWidget {
  ScaffoldDrawer({Key? key}) : super(key: key);
  final WrapperScaffoldController _wrapperScaffoldController = Get.find();

  Widget _drawerButton({
    required IconData icon,
    required String text,
    required void Function() callback,
  }) {
    final BuildContext context = Get.context!;
    return Column(
      children: [
        MaterialButton(
          onPressed: callback,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  height: 50,
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }

  Widget _drawerHeader() {
    BuildContext context = Get.context!;

    return SizedBox(
      height: 120,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(8),
          width: double.maxFinite,
          color: Theme.of(context).colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                minRadius: 20,
                maxRadius: 40,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
              ),
              Text(
                'Hayk Darbinyan',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _drawerHeader(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _drawerButton(
                    text: 'Profile',
                    icon: Icons.person_rounded,
                    callback: () {},
                  ),
                  _drawerButton(
                    text: 'Communities',
                    icon: Icons.people_alt_outlined,
                    callback: _wrapperScaffoldController.goToCommunities,
                  ),
                  _drawerButton(
                    text: 'Logout',
                    icon: Icons.logout,
                    callback: _wrapperScaffoldController.handleLogout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
