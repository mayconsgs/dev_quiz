import 'package:dev_quiz/controllers/challenge_controller.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/screens/end_quiz_screen.dart';
import 'package:dev_quiz/widgets/linear_progress_widget.dart';
import 'package:dev_quiz/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeScreen extends StatelessWidget {
  final ChallengeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                BackButton(color: AppColors.lightGrey),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                                'Questão ${controller.questionAnswered + 1}',
                                style: AppTextStyles.body),
                          ),
                          Text('de ${controller.totalQuestions}',
                              style: AppTextStyles.body),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => LinearProgressWidget(
                            value: controller.questionAnswered /
                                controller.totalQuestions),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: QuizWidget(),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text('Pular'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.validateQuestion
                        ? controller.questionAnswered + 1 ==
                                controller.totalQuestions
                            ? () {
                                Get.off(() => EndQuizScreen());
                              }
                            : controller.nextQuestion
                        : controller.confirmQuestion,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.darkGreen),
                    ),
                    child: controller.validateQuestion
                        ? Text(controller.questionAnswered + 1 ==
                                controller.totalQuestions
                            ? 'Finalizar'
                            : 'Próxima')
                        : Text('Confirmar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
