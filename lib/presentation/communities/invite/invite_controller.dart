import 'package:get/get.dart';
import 'package:kaits_app/backend/users_backend.dart';
import 'package:kaits_app/models/backend_response.dart';
import 'package:kaits_app/models/community.dart';
import 'package:kaits_app/models/user.dart';

class InviteController extends GetxController {
  RxList<User> listOfUsers = <User>[].obs;
  final Community _community = Get.arguments['community'];

  Future<void> onQueryChanged(String newValue) async {
    if (newValue.isEmpty) {
      listOfUsers.value = [];
      return;
    }

    BackendReponse _resposne = await UsersBackend.searchUsers(
      query: newValue,
      community: _community,
    );

    if (!_resposne.success) return;

    listOfUsers.value = _resposne.payload;
  }
}
