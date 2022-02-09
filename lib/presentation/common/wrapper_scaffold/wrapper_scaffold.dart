import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/common/scaffold_drawer.dart';
import 'package:kaits_app/presentation/common/wrapper_scaffold/wrapper_scaffold_controller.dart';

class WrapperScaffold extends StatelessWidget {
  WrapperScaffold({
    Key? key,
    required this.child,
    required this.appBar,
  }) : super(key: key);

  final Widget child;
  final AppBar appBar;

  final WrapperScaffoldController _wrapperScaffoldController = Get.put(
    WrapperScaffoldController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ScaffoldDrawer(),
        drawerEnableOpenDragGesture: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: appBar,
        body: child,
      ),
    );
  }
}
