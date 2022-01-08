import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaits_app/presentation/start/start_controller.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);

  final StartController _startController = StartController();

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: _startController.loginButtonCallback,
      child: const Text(
        'Login',
      ),
    );
  }

  Widget _registerButton() {
    return OutlinedButton(
      onPressed: _startController.registerButtonCallback,
      child: const Text(
        'Register',
      ),
    );
  }

  Widget _logo() {
    final BuildContext context = Get.context!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
        ),
        child: Text(
          'Kaits',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _startController,
      builder: (StartController controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 50,
              ),
              child: SizedBox(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _logo(),
                    _loginButton(),
                    _registerButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
