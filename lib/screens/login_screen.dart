import 'package:dev_quiz/controllers/login_controller.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: ListView(
          padding: const EdgeInsets.all(16),
          physics: ScrollPhysics(),
          children: [
            const SizedBox(height: 100),
            SvgPicture.asset(
              'assets/svg/logo.svg',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 38),
            TextFormField(
              controller: controller.loginController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'E-mail'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: controller.passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Senha'),
            ),
            const SizedBox(height: 38),
            ElevatedButton(
              onPressed: controller.signIn,
              child: Text('Login'),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Não possui conta?',
                style: AppTextStyles.bodylightGrey,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.off(() => SignUpScreen());
              },
              child: Text('Cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}
