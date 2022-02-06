import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/models/community_form.dart';
import 'package:kaits_app/presentation/common/wrapper_scaffold/wrapper_scaffold.dart';
import 'package:kaits_app/presentation/communities/communities_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CommunitiesPage extends StatelessWidget {
  CommunitiesPage({Key? key}) : super(key: key);

  final CommunitiesController _communitiesController = Get.put(
    CommunitiesController(),
  );

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
        height: 80,
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

  Widget _communitiesList() {
    final BuildContext context = Get.context!;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
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

  Widget _communityCard(Community community) {
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
              vertical: 10,
              horizontal: 20,
            ),
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            onPressed: () {
              _communitiesController.goToCommunityCallback(community);
            },
            child: AutoSizeText(
              community.name,
              maxLines: 2,
              textAlign: TextAlign.center,
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
        return WrapperScaffold(
          headerTitle: 'Communities',
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
