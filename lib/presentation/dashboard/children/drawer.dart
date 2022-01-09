import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/dashboard/dashboard_controller.dart';

class DashboardDrawer extends StatelessWidget {
  DashboardDrawer({Key? key}) : super(key: key);

  final DashboardController _dashboardController = Get.find();

  Widget _drawerButton() {
    final BuildContext context = Get.context!;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.logout),
              Expanded(
                child: MaterialButton(
                  onPressed: _dashboardController.handleLogout,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height: 50,
                  ),
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
                  _drawerButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
