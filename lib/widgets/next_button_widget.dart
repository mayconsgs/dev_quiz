import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback ontap;

  NextButtonWidget(
      {required this.label,
      required this.ontap,
      this.backgroundColor,
      this.textColor});

  NextButtonWidget.purple({required String label, required VoidCallback ontap})
      : this.backgroundColor = AppColors.purple,
        this.textColor = AppColors.white,
        this.label = label,
        this.ontap = ontap;

  NextButtonWidget.green({required String label, required VoidCallback ontap})
      : this.backgroundColor = AppColors.darkGreen,
        this.textColor = AppColors.white,
        this.label = label,
        this.ontap = ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? AppColors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: backgroundColor ?? AppColors.border,
              ),
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: textColor ?? AppColors.lightGrey,
          ),
        ),
        onPressed: ontap,
      ),
    );
  }
}
