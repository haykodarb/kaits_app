import 'package:get/get.dart';
import 'package:kaits_app/backend/communities_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/community_form.dart';
import 'package:kaits_app/routes.dart';

class CommunitiesController extends GetxController {
  RxList<Community> communitiesForUser = <Community>[].obs;

  void createNewButtonCallback() {
    Get.toNamed(RouteNames.createCommunityPage);
  }

  Future<void> _loadCommunitiesForUser() async {
    final BackendReponse _backendResponse =
        await CommunitiesBackend.getCommunitiesForUser();

    if (_backendResponse.success) {
      communitiesForUser.value = _backendResponse.payload;
    }
  }

  @override
  void onReady() {
    super.onReady();
    _loadCommunitiesForUser();
  }

  @override
  void onInit() {
    super.onInit();
    _loadCommunitiesForUser();
  }
}
