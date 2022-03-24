import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/models/community.dart';
import 'package:kaits_app/presentation/common/wrapper_scaffold/wrapper_scaffold.dart';
import 'package:kaits_app/presentation/communities/communities_controller.dart';
import 'package:kaits_app/routes.dart';

class CommunitiesPage extends StatelessWidget {
  CommunitiesPage({Key? key}) : super(key: key);

  final CommunitiesController _communitiesController = Get.put(
    CommunitiesController(),
  );

  Widget _bottomSheetButton({
    required IconData icon,
    required String text,
    required void Function() callback,
  }) {
    final BuildContext context = Get.context!;
    return MaterialButton(
      onPressed: callback,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomSheet(Community community) {
    final BuildContext context = Get.context!;
    return BottomSheet(
      onClosing: () {},
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 10,
      enableDrag: false,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _bottomSheetButton(
                  icon: Icons.person_add_alt_1,
                  text: 'Invite User',
                  callback: () {
                    Get.toNamed(
                      RouteNames.inviteCommunityPage,
                      arguments: {
                        "community": community,
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: _bottomSheetButton(
                  icon: Icons.person_remove,
                  text: 'Kick User',
                  callback: () {},
                ),
              ),
              Expanded(
                child: _bottomSheetButton(
                  icon: Icons.admin_panel_settings,
                  text: 'Manage Admins',
                  callback: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomButtons() {
    final BuildContext context = Get.context!;

    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondaryVariant,
          width: 1.5,
        ),
      ),
      child: SizedBox(
        height: 70,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: _communitiesController.joinOneButtonCallback,
                child: Text(
                  'Join one',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
              TextButton(
                onPressed: _communitiesController.createNewButtonCallback,
                child: Text(
                  'Create new',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _communityCard(Community community) {
    final BuildContext context = Get.context!;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                _communitiesController.goToCommunityCallback(community);
              },
              onLongPress: () {
                Get.bottomSheet(
                  _bottomSheet(community),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.onPrimary,
                elevation: 20,
                shadowColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(30),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 125,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      community.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                    Text(
                      community.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                    Text(
                      'Members: ${community.users.length}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _communitiesList() {
    final BuildContext context = Get.context!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: ShaderMask(
          shaderCallback: (Rect rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.secondaryVariant,
                Colors.transparent,
                Colors.transparent,
                Theme.of(context).colorScheme.secondaryVariant,
              ],
              stops: const <double>[
                0.0,
                0.05,
                0.95,
                1.0,
              ],
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: Scrollbar(
            thickness: 10,
            radius: const Radius.circular(10),
            child: Obx(
              () {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _communityCard(
                      _communitiesController.communitiesForUser[index],
                    );
                  },
                  itemCount: _communitiesController.communitiesForUser.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Communities'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _communitiesController,
      builder: (CommunitiesController controller) {
        return WrapperScaffold(
          appBar: _appBar(),
          child: Container(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _communitiesList(),
                _bottomButtons(),
              ],
            ),
          ),
        );
      },
    );
  }
}
