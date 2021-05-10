import 'package:dev_quiz/controllers/challenge_controller.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndQuizScreen extends StatelessWidget {
  final ChallengeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.trophy)),
          const SizedBox(height: 40),
          Text('Parabéns', style: AppTextStyles.heading40),
          const SizedBox(height: 16),
          Text('Você concluiu'),
          Text(controller.titleQuiz),
          Text(
            'Com ${controller.rightQuestionCount} acertos de ${controller.totalQuestions} questões',
          ),
          TextButton(
            onPressed: () {
              controller.dispose();
              Get.offAll(() => HomeScreen());
            },
            child: Text('Voltar ao início'),
          ),
        ],
      ),
    );
  }
}
