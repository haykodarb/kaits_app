import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/dashboard/dashboard_controller.dart';
import 'package:kaits_app/routes.dart';

enum DrawerButtons {
  home,
  communities,
  logout,
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
              Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.surface,
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Get.offAllNamed(RouteNames.startPage);
                  },
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

  AppBar _appBar() {
    return AppBar(
      iconTheme: const IconThemeData(size: 30),
      centerTitle: true,
      title: const Text(
        'Community Name',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
      ),
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

  Drawer _drawer() {
    final BuildContext context = Get.context!;

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

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: _appBar(),
            body: const Text('Dashboard'),
            drawer: _drawer(),
            drawerEnableOpenDragGesture: true,
          ),
        );
      },
    );
  }
}
