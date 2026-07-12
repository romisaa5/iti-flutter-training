import 'package:flutter/material.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class CartSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const CartSummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = isBold
        ? AppTextStyles.font16Bold.copyWith(color: LightAppColors.neutral900)
        : AppTextStyles.font14Regular.copyWith(color: LightAppColors.grey700);
    final valueStyle = isBold
        ? AppTextStyles.font16Bold.copyWith(color: LightAppColors.neutral900)
        : AppTextStyles.font14SemiBold.copyWith(
            color: LightAppColors.neutral900,
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: labelStyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
