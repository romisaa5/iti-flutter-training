import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/profile/presentation/widgets/account_menu_item_data.dart';

class AccountMenuItem extends StatelessWidget {
  final AccountMenuItemData data;

  const AccountMenuItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: data.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(data.icon, size: 22, color: LightAppColors.neutral800),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                data.label,
                style: AppTextStyles.font14SemiBold.copyWith(
                  color: LightAppColors.neutral900,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: LightAppColors.grey400,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
