import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/communities/communities_controller.dart';
import 'package:kaits_app/routes.dart';

class CommunitiesPage extends StatelessWidget {
  CommunitiesPage({Key? key}) : super(key: key);

  final CommunitiesController _communitiesController = CommunitiesController();

  Widget _bottomButtons() {
    final BuildContext context = Get.context!;

    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
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
    );
  }

  Widget _communitiesList() {
    return Expanded(
      flex: 3,
      child: Obx(
        () {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _communityCard(
                _communitiesController.communitiesForUser[index].name,
              );
            },
            itemCount: _communitiesController.communitiesForUser.length,
          );
        },
      ),
    );
  }

  Widget _communityCard(String name) {
    final BuildContext context = Get.context!;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 100,
          maxWidth: 250,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: 100,
          width: double.maxFinite,
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            onPressed: () {
              Get.offAllNamed(RouteNames.dashboardPage);
            },
            child: Text(
              name,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _communitiesController,
      builder: (CommunitiesController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Choose a community',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
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
