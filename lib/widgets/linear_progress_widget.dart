import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class LinearProgressWidget extends LinearProgressIndicator {
  LinearProgressWidget({required double value})
      : super(
          backgroundColor: AppColors.chartSecondary,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          value: value,
        );
}
