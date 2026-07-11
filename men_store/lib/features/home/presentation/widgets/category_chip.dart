import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? LightAppColors.primary600 : LightAppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? LightAppColors.primary600
                : LightAppColors.grey300,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.font14SemiBold.copyWith(
            color: isSelected ? LightAppColors.white : LightAppColors.grey700,
          ),
        ),
      ),
    );
  }
}
