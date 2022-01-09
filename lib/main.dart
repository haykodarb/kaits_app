import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kaits_app/backend/login_backend.dart';
import 'package:kaits_app/routes.dart';
import 'package:kaits_app/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory directory = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(directory.path);

  final bool _isLoggedIn = await LoginBackend.getAuthToken() != null;
  runApp(
    MyApp(
      isLoggedIn: _isLoggedIn,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kaits',
      theme: theme,
      getPages: routes(),
      color: Theme.of(context).colorScheme.background,
      initialRoute:
          isLoggedIn ? RouteNames.communitiesPage : RouteNames.startPage,
    );
  }
}
