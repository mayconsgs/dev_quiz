import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({required this.label})
      : assert(['Fácil', 'Médio', 'Difícil', 'Perito'].contains(label));

  final config = {
    'Fácil': {
      'backgroundColor': AppColors.levelButtonFacil,
      'borderColor': AppColors.levelButtonBorderFacil,
      'textColor': AppColors.levelButtonTextFacil
    },
    'Médio': {
      'backgroundColor': AppColors.levelButtonMedio,
      'borderColor': AppColors.levelButtonBorderMedio,
      'textColor': AppColors.levelButtonTextMedio
    },
    'Difícil': {
      'backgroundColor': AppColors.levelButtonDificil,
      'borderColor': AppColors.levelButtonBorderDificil,
      'textColor': AppColors.levelButtonTextDificil
    },
    'Perito': {
      'backgroundColor': AppColors.levelButtonPerito,
      'borderColor': AppColors.levelButtonBorderPerito,
      'textColor': AppColors.levelButtonTextPerito
    }
  };

  Color get backgroundColor => config[label]!['backgroundColor']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get textColor => config[label]!['textColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Text(
        label,
        style: GoogleFonts.notoSans(color: textColor, fontSize: 13),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.fromBorderSide(
          BorderSide(color: borderColor),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
    );
  }
}
