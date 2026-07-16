import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';

class SearchResultsHeader extends StatelessWidget {
  final String query;
  final int count;

  const SearchResultsHeader({
    super.key,
    required this.query,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              style: AppTextStyles.font16SemiBold.copyWith(
                color: LightAppColors.neutral900,
              ),
              children: [
                const TextSpan(text: 'Results for '),
                TextSpan(
                  text: '"$query"',
                  style: AppTextStyles.font16Bold.copyWith(
                    color: LightAppColors.neutral900,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          '$count Results Found',
          style: AppTextStyles.font12Regular.copyWith(
            color: LightAppColors.grey500,
          ),
        ),
      ],
    );
  }
}
