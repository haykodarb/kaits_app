import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:kaits_app/pages/login/login.dart';
import 'package:kaits_app/pages/dashboard/dashboard.dart';

class RouteNames {
  static const loginPage = '/login';
  static const dashboardPage = '/dashboard';
}

List<GetPage> routes() => <GetPage>[
      GetPage<dynamic>(
        name: RouteNames.loginPage,
        page: () => const LoginPage(),
      ),
      GetPage<dynamic>(
        name: RouteNames.dashboardPage,
        page: () => const DashboardPage(),
      ),
    ];
