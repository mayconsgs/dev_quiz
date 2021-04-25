import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/models/quiz_model.dart';
import 'package:dev_quiz/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  QuizCardWidget({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            quiz.image,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
          Text(
            quiz.title,
            style: AppTextStyles.heading15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '${quiz.questionAnswered} de ${quiz.questions.length}',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 3,
                child: LinearProgressWidget(
                    value: quiz.questionAnswered / quiz.questions.length),
              ),
            ],
          )
        ],
      ),
    );
  }
}
