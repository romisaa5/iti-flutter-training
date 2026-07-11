import 'package:flutter/material.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class DiscoverSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onFilterTap;

  const DiscoverSearchBar({
    super.key,
    required this.controller,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: LightAppColors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: LightAppColors.grey200),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: LightAppColors.grey500, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: AppTextStyles.font14Regular.copyWith(
                      color: LightAppColors.neutral900,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search for clothes...',
                      hintStyle: AppTextStyles.font14Regular.copyWith(
                        color: LightAppColors.grey500,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onFilterTap,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: LightAppColors.primary600,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.tune_rounded, color: LightAppColors.white),
          ),
        ),
      ],
    );
  }
}
