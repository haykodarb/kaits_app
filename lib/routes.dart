import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kaits_app/presentation/login/login_page.dart';
import 'package:kaits_app/presentation/dashboard/dashboard_page.dart';
import 'package:kaits_app/presentation/register/register_page.dart';
import 'package:kaits_app/presentation/start/start_page.dart';

class RouteNames {
  static const loginPage = '/login';
  static const startPage = '/start';
  static const dashboardPage = '/dashboard';
  static const registerPage = '/register';
}

List<GetPage> routes() => <GetPage>[
      GetPage<dynamic>(
        name: RouteNames.startPage,
        page: () => StartPage(),
      ),
      GetPage<dynamic>(
        name: RouteNames.loginPage,
        page: () => LoginPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(
          milliseconds: 500,
        ),
      ),
      GetPage<dynamic>(
        name: RouteNames.registerPage,
        page: () => RegisterPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(
          milliseconds: 500,
        ),
      ),
      GetPage<dynamic>(
        name: RouteNames.dashboardPage,
        page: () => const DashboardPage(),
        transition: Transition.cupertino,
      ),
    ];
