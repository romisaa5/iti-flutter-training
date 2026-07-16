import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';

class SimpleBackAppBar extends StatelessWidget {
  final String title;

  const SimpleBackAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: LightAppColors.neutral900,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: AppTextStyles.font18Bold.copyWith(
              color: LightAppColors.neutral900,
            ),
          ),
        ],
      ),
    );
  }
}
