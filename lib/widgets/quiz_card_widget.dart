import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
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
            AppImages.blocks,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
          Text(
            'Gerenciamento de estado',
            style: AppTextStyles.heading15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '3 de 10',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 3,
                child: LinearProgressWidget(value: 0.3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
