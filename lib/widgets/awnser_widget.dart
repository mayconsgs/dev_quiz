import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String label;
  final bool isRight;
  final bool isSelected;
  final bool validate;
  final VoidCallback onTap;

  AwnserWidget({
    required this.label,
    this.isRight = false,
    this.isSelected = false,
    this.validate = false,
    required this.onTap,
  });

  Color get _selectedBackgroundCardRight => validate
      ? isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _selectedBorderCardRight => validate
      ? isRight
          ? AppColors.green
          : AppColors.red
      : AppColors.purple;

  TextStyle get _selectedTextStyleRight => validate
      ? isRight
          ? AppTextStyles.bodyDarkGreen
          : AppTextStyles.bodyDarkRed
      : AppTextStyles.bodyPurple;

  IconData get _selectedIconRight => validate
      ? isRight
          ? Icons.check
          : Icons.close
      : Icons.check;

  Color get _selectedIconColorRight => validate
      ? isRight
          ? AppColors.darkGreen
          : AppColors.darkRed
      : AppColors.purple;

  Color get _selectedIconBorderColorRight => validate
      ? isRight
          ? AppColors.lightGreen
          : AppColors.lightRed
      : AppColors.white;

  Color get _selectedIconBoxShadowRight => validate
      ? isRight
          ? Color.fromARGB(102, 4, 211, 97)
          : Color.fromARGB(102, 204, 55, 80)
      : Color.fromARGB(102, 130, 87, 229);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: isSelected ? _selectedBackgroundCardRight : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? _selectedBorderCardRight : AppColors.border,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style:
                      isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: isSelected ? _selectedIconColorRight : null,
                  borderRadius: BorderRadius.circular(12),
                  border:
                      isSelected ? null : Border.all(color: AppColors.border),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                              color: _selectedIconBoxShadowRight,
                              blurRadius: 12)
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
        ),
      ),
    );
  }
}
