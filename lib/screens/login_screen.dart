import 'package:dev_quiz/controllers/login_controller.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: controller.loginController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: controller.passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.signIn,
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
