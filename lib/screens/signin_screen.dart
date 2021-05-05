import 'package:dev_quiz/controllers/signin_controller.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = SignInController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Form(
          key: _formKey,
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
                validator: (value) {
                  if (!GetUtils.isEmail(value!)) return 'E-mail inválido';

                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.passController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Senha'),
                validator: (value) {
                  if (!RegExp(AppUtils.passRegEx).hasMatch(value!))
                    return '8 caracteres, número, simbolo, maiúsculas e minúsculas';

                  return null;
                },
              ),
              const SizedBox(height: 12),
              Obx(() {
                if (controller.hasLoginError)
                  return Center(
                      child: Text(
                    'E-mail ou Senha incorretos',
                    style: AppTextStyles.bodyDarkRed
                        .merge(TextStyle(fontSize: 15)),
                  ));

                return Container();
              }),
              const SizedBox(height: 26),
              Obx(() {
                if (controller.isLoading)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate())
                          await controller.signIn();
                      },
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
