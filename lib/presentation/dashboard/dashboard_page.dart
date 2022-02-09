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
          child: SizedBox(),
          appBar: AppBar(),
        );
      },
    );
  }
}
