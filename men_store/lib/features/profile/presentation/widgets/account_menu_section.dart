import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/features/profile/presentation/widgets/account_menu_item.dart';
import 'package:men_store/features/profile/presentation/widgets/account_menu_item_data.dart';

class AccountMenuSection extends StatelessWidget {
  final List<AccountMenuItemData> items;

  const AccountMenuSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          AccountMenuItem(data: items[i]),
          if (i != items.length - 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(height: 1, color: LightAppColors.grey200),
            ),
        ],
      ],
    );
  }
}
