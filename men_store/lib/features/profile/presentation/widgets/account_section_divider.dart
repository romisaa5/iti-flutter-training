import 'package:flutter/material.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';

class AccountSectionDivider extends StatelessWidget {
  const AccountSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 8, color: LightAppColors.grey100);
  }
}
