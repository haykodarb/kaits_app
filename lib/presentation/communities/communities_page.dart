import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:kaits_app/presentation/communities/communities_controller.dart';
import 'package:kaits_app/routes.dart';

class CommunitiesPage extends StatelessWidget {
  CommunitiesPage({Key? key}) : super(key: key);

  final CommunitiesController _communitiesController = CommunitiesController();

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
              Get.toNamed(RouteNames.dashboardPage);
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
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.2,
                    child: const Align(
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
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return _communityCard('Community $index');
                      },
                      itemCount: 10,
                    ),
                  ),
                  SizedBox(
                      height: constraints.maxHeight * 0.2,
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
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Create new',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
