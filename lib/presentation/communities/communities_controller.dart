import 'package:get/get.dart';
import 'package:kaits_app/backend/communities_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/community.dart';
import 'package:kaits_app/routes.dart';

class CommunitiesController extends GetxController {
  RxList<Community> communitiesForUser = <Community>[].obs;
  RxList<Community> adminCommunities = <Community>[].obs;

  Future<void> getAdminCommunities() async {
    final BackendReponse _backendResponse =
        await CommunitiesBackend.getAdminCommunitiesForUser();

    if (_backendResponse.success) {
      adminCommunities.value = _backendResponse.payload;
    }

    if (adminCommunities.isNotEmpty) {
      CommunitiesBackend.getUsersInCommunity(adminCommunities[0]);
    }
  }

  void createNewButtonCallback() {
    Get.toNamed(RouteNames.createCommunityPage);
  }

  void joinOneButtonCallback() {
    Get.toNamed(RouteNames.joinCommunityPage);
  }

  Future<void> getCommunitiesForUser() async {
    final BackendReponse _backendResponse =
        await CommunitiesBackend.getCommunitiesForUser();

    if (_backendResponse.success) {
      communitiesForUser.value = _backendResponse.payload;
    }
  }

  Future<void> goToCommunityCallback(Community community) async {
    Get.offAllNamed(RouteNames.dashboardPage);
  }

  @override
  void onInit() {
    super.onInit();
    getCommunitiesForUser();
  }
}
