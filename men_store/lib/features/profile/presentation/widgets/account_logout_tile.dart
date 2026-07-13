import 'package:flutter/material.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class AccountLogoutTile extends StatelessWidget {
  const AccountLogoutTile({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(
              Icons.logout_rounded,
              size: 22,
              color: LightAppColors.error500,
            ),
            const SizedBox(width: 14),
            Text(
              'Logout',
              style: AppTextStyles.font14SemiBold.copyWith(
                color: LightAppColors.error500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
