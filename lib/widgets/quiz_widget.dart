import 'package:dev_quiz/controllers/challenge_controller.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/widgets/awnser_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizWidget extends StatelessWidget {
  final ChallengeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              controller.currentQuestion.title,
              style: AppTextStyles.heading,
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => Column(
              children: [
                ...controller.currentQuestion.awnsers
                    .map(
                      (e) => Obx(
                        () => AwnserWidget(
                          label: e.label,
                          isRight: e.isRight,
                          isSelected: controller.selectedAwnser ==
                              controller.currentQuestion.awnsers.indexOf(e),
                          validate: controller.validateQuestion,
                          onTap: controller.validateQuestion
                              ? null
                              : () {
                                  controller.selectAwnser(e);
                                },
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
