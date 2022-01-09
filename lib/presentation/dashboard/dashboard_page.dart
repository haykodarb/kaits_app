import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/dashboard/children/book.dart';
import 'package:kaits_app/presentation/dashboard/children/drawer.dart';
import 'package:kaits_app/presentation/dashboard/dashboard_controller.dart';

enum DrawerButtons {
  home,
  communities,
  logout,
}

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final DashboardController _dashboardController = Get.put(
    DashboardController(),
  );

  AppBar _appBar() {
    return AppBar(
      iconTheme: const IconThemeData(
        size: 30,
      ),
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _dashboardController,
      builder: (DashboardController controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: _appBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Obx(
                () {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: _dashboardController.loadedBooks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BookCard(
                        book: _dashboardController.loadedBooks[index],
                        alignLeft: index % 2 == 0,
                      );
                    },
                  );
                },
              ),
            ),
            drawer: DashboardDrawer(),
            drawerEnableOpenDragGesture: true,
          ),
        );
      },
    );
  }
}
