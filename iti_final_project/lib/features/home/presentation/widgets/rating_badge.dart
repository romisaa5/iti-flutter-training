import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const RatingBadge({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_rounded, color: LightAppColors.warning500, size: 20),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: AppTextStyles.font14SemiBold.copyWith(
            color: LightAppColors.neutral900,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewCount Review)',
          style: AppTextStyles.font14Regular.copyWith(
            color: LightAppColors.grey500,
          ),
        ),
      ],
    );
  }
}
