import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/wrapper_scaffold/wrapper_scaffold.dart';
import 'package:kaits_app/presentation/dashboard/children/book.dart';
import 'package:kaits_app/presentation/dashboard/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final DashboardController _dashboardController = Get.put(
    DashboardController(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _dashboardController,
      builder: (DashboardController controller) {
        return WrapperScaffold(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Fiction',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: Obx(
                    () {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 15,
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
                const SizedBox(
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Non-fiction',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: Obx(
                    () {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 15,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
