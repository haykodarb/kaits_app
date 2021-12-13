import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/pages/login/controller.dart';
import 'package:kaits_app/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Card _logo() {
    BuildContext? context = Get.context;

    return Card(
      elevation: 20,
      color: Theme.of(context!).colorScheme.primaryVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Text(
          'Kaits',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _loginForm() {
    BuildContext context = Get.context!;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300, maxWidth: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text('Username'),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              floatingLabelStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(20),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Password'),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.surface,
              ),
              floatingLabelStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(20),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Get.offAllNamed(RouteNames.dashboardPage);
            },
            minWidth: 400,
            height: 55,
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Need to ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Text(
                  'register?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (LoginController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  child: _logo(),
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                ),
                _loginForm(),
              ],
            ),
          ),
        );
      },
    );
  }
}
