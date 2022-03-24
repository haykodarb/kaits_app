import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:kaits_app/presentation/communities/communities_page.dart';
import 'package:kaits_app/presentation/communities/create/create_community.dart';
import 'package:kaits_app/presentation/communities/invite/invite_page.dart';
import 'package:kaits_app/presentation/communities/join/join_page.dart';
import 'package:kaits_app/presentation/login/login_page.dart';
import 'package:kaits_app/presentation/dashboard/dashboard_page.dart';
import 'package:kaits_app/presentation/register/register_page.dart';
import 'package:kaits_app/presentation/start/start_page.dart';

class RouteNames {
  static const startPage = '/start';
  static const loginPage = '/login';
  static const registerPage = '/register';
  static const dashboardPage = '/dashboard';
  static const communitiesPage = '/communities';
  static const manageCommunitiesPage = '/communities/manage';
  static const createCommunityPage = '/communities/create';
  static const joinCommunityPage = '/communities/join';
  static const inviteCommunityPage = '/communities/invite';
}

List<GetPage> routes() => <GetPage>[
      GetPage<dynamic>(
        name: RouteNames.startPage,
        transition: Transition.noTransition,
        page: () => StartPage(),
      ),
      GetPage<dynamic>(
        name: RouteNames.loginPage,
        page: () => LoginPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(
          milliseconds: 300,
        ),
      ),
      GetPage<dynamic>(
        name: RouteNames.registerPage,
        page: () => RegisterPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(
          milliseconds: 300,
        ),
      ),
      GetPage<dynamic>(
        name: RouteNames.dashboardPage,
        transition: Transition.noTransition,
        page: () => DashboardPage(),
      ),
      GetPage<dynamic>(
        name: RouteNames.communitiesPage,
        transition: Transition.noTransition,
        page: () => CommunitiesPage(),
      ),
      GetPage<dynamic>(
        name: RouteNames.createCommunityPage,
        page: () => CreateCommunityPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(
          milliseconds: 300,
        ),
      ),
      GetPage<dynamic>(
        name: RouteNames.joinCommunityPage,
        page: () => JoinCommunityPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(
          milliseconds: 300,
        ),
      ),
      GetPage<dynamic>(
        name: RouteNames.inviteCommunityPage,
        page: () => InviteCommunityPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(
          milliseconds: 300,
        ),
      ),
    ];
