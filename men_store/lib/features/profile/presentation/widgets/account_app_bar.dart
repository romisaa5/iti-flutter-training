import 'package:flutter/material.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key});

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
          Expanded(
            child: Center(
              child: Text(
                'Account',
                style: AppTextStyles.font20Bold.copyWith(
                  color: LightAppColors.neutral900,
                ),
              ),
            ),
          ),

          const SizedBox(width: 24),
        ],
      ),
    );
  }
}
