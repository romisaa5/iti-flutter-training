import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (icon: Icons.home_rounded, label: 'Home'),
      (icon: Icons.shopping_cart_outlined, label: 'Cart'),
      (icon: Icons.person_outline_rounded, label: 'Account'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: LightAppColors.white,
        boxShadow: [
          BoxShadow(
            color: LightAppColors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (index) {
            final isSelected = index == currentIndex;
            final item = items[index];
            final color = isSelected
                ? LightAppColors.primary600
                : LightAppColors.grey500;
            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(item.icon, color: color, size: 24),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: AppTextStyles.font12Regular.copyWith(color: color),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
