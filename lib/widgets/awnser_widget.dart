import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String label;
  final bool isRight;
  final bool isSelected;
  final bool validate;
  final VoidCallback? onTap;

  AwnserWidget({
    required this.label,
    this.isRight = false,
    this.isSelected = false,
    this.validate = false,
    this.onTap,
  });

  Color get _selectedBackgroundCardRight => isSelected
      ? validate
          ? isRight
              ? AppColors.lightGreen
              : AppColors.lightRed
          : AppColors.white
      : AppColors.white;

  Color get _selectedBorderCardRight => isSelected
      ? validate
          ? isRight
              ? AppColors.green
              : AppColors.red
          : AppColors.purple
      : AppColors.border;

  TextStyle get _selectedTextStyleRight => isSelected
      ? validate
          ? isRight
              ? AppTextStyles.bodyDarkGreen
              : AppTextStyles.bodyDarkRed
          : AppTextStyles.bodyPurple
      : AppTextStyles.body;

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

  Color get _selectedIconBoxShadowRight => isSelected
      ? validate
          ? isRight
              ? AppColors.darkGreen.withOpacity(0.4)
              : AppColors.darkRed.withOpacity(0.4)
          : AppColors.purple.withOpacity(0.4)
      : Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: _selectedBackgroundCardRight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: _selectedBorderCardRight,
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
                  style: _selectedTextStyleRight,
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
                  boxShadow: [
                    BoxShadow(
                        color: _selectedIconBoxShadowRight, blurRadius: 12)
                  ],
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
