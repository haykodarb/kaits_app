import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/scaffold_drawer.dart';
import 'package:kaits_app/presentation/common/wrapper_scaffold/wrapper_scaffold_controller.dart';

class WrapperScaffold extends StatelessWidget {
  WrapperScaffold({
    Key? key,
    required this.child,
    this.headerTitle = '',
  }) : super(key: key);

  final Widget child;
  final String headerTitle;

  final WrapperScaffoldController _wrapperScaffoldController =
      Get.put(WrapperScaffoldController());

  AppBar _appBar() {
    final BuildContext context = Get.context!;
    return AppBar(
      iconTheme: const IconThemeData(
        size: 30,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      centerTitle: true,
      title: Text(
        headerTitle,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ScaffoldDrawer(),
        drawerEnableOpenDragGesture: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: _appBar(),
        body: child,
      ),
    );
  }
}
