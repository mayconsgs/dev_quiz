import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String label;
  final bool isRight;
  final bool isSelected;

  AwnserWidget({
    required this.label,
    this.isRight = false,
    this.isSelected = false,
  });

  Color get _selectedBackgroundCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  Color get _selectedIconColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedIconBorderColorRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedIconBoxShadowRight => isRight
      ? Color.fromARGB(102, 4, 211, 97)
      : Color.fromARGB(102, 204, 55, 80);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? _selectedBackgroundCardRight : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? _selectedBorderCardRight : AppColors.border,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
            ),
          ),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: isSelected ? _selectedIconColorRight : null,
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? null : Border.all(color: AppColors.border),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                          color: _selectedIconBoxShadowRight, blurRadius: 12)
                    ]
                  : null,
            ),
            child: isSelected
                ? Icon(
                    _selectedIconRight,
                    color: _selectedIconBorderColorRight,
                    size: 16,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
