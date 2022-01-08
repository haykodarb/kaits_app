import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/routes.dart';
import 'package:kaits_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kaits',
      theme: theme,
      getPages: routes(),
      color: Theme.of(context).colorScheme.background,
      initialRoute: RouteNames.startPage,
    );
  }
}
