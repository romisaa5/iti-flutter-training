import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;

  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.font18Bold.copyWith(
            color: LightAppColors.neutral900,
          ),
        ),
        GestureDetector(
          onTap: onSeeAllTap,
          child: Text(
            'See All',
            style: AppTextStyles.font14SemiBold.copyWith(
              color: LightAppColors.primary600,
            ),
          ),
        ),
      ],
    );
  }
}
