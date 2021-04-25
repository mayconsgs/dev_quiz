import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends PreferredSize {
  QuestionIndicatorWidget()
      : super(
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
                            Text('Questão 04', style: AppTextStyles.body),
                            Text('de 10', style: AppTextStyles.body),
                          ],
                        ),
                        const SizedBox(height: 16),
                        LinearProgressWidget(value: 0.4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
