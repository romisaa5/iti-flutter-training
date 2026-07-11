import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';

class AuthRichText extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const AuthRichText({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: AppTextStyles.font14Regular.copyWith(
          color: LightAppColors.grey700,
        ),
        children: [
          TextSpan(
            text: actionText,
            style: AppTextStyles.font14Regular.copyWith(
              color: LightAppColors.primary600,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
