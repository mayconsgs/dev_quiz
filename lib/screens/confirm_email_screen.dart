import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: SafeArea(
          top: true,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 200),
              Text(
                'Confirme seu e-mail para prosseguir',
                style: AppTextStyles.titleBold,
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.currentUser!
                        .sendEmailVerification();

                    Get.offAll(() => HomeScreen());
                  },
                  child: Text('Enviar e-mail de confirmação')),
              const SizedBox(height: 36),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Text('Voltar para login!'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
