import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final int score;

  const ScoreCardWidget({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 88,
                height: 88,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 88,
                        height: 88,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: score / 100,
                          backgroundColor: AppColors.chartSecondary,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.chartPrimary),
                        ),
                      ),
                    ),
                    Center(
                      child: Text('$score%', style: AppTextStyles.heading),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        score == 0 ? 'Vamos começar' : 'Bom resultado ',
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        score == 0
                            ? 'Complete os desafios e avance em conhecimento'
                            : 'Seu conhecimento está sendo aprimorado :)',
                        style: AppTextStyles.body,
                      ),
                    ],
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
