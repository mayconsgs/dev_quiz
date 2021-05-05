import 'package:dev_quiz/controllers/signUpController.dart';
import 'package:dev_quiz/core/app_utils.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final controller = SignUpController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: SafeArea(
          top: true,
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              physics: ScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: controller.getImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Obx(
                        () {
                          if (controller.hasImage)
                            return Image.file(
                              controller.image,
                              fit: BoxFit.cover,
                            );

                          return Container(
                            color: AppColors.lightGrey,
                            child: Icon(
                              Icons.person,
                              size: 350,
                              color: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                TextFormField(
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(hintText: 'Nome'),
                  validator: (value) {
                    if (value!.isEmpty) return 'Este campo é obrigatório';

                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: controller.emailController,
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

                    if (controller.invalidPass)
                      return 'As senhas não coinsidem';

                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: controller.confirmPassController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Confirmar senha'),
                  validator: (value) {
                    if (!RegExp(AppUtils.passRegEx).hasMatch(value!))
                      return '8 caracteres, número, simbolo, maiúsculas e minúsculas';

                    if (controller.invalidPass)
                      return 'As senhas não coinsidem';

                    return null;
                  },
                ),
                const SizedBox(height: 38),
                Obx(
                  () => ElevatedButton(
                    child: controller.isLoading
                        ? CircularProgressIndicator()
                        : Text('Cadastrar'),
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate())
                              controller.signUpUser();
                          },
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Já possui conta?',
                    style: AppTextStyles.bodylightGrey,
                  ),
                ),
                Obx(
                  () => TextButton(
                    child: Text('Login'),
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            Get.off(() => LoginScreen());
                          },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
