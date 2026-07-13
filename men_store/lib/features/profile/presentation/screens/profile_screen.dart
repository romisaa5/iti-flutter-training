import 'package:flutter/material.dart';
import 'package:men_store/core/helpers/app_navigator.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/features/locations/presentation/screens/address_screen.dart';
import 'package:men_store/features/login/presentation/screens/login_screen.dart';
import 'package:men_store/features/profile/presentation/widgets/account_app_bar.dart';
import 'package:men_store/features/profile/presentation/widgets/account_logout_dialog.dart';
import 'package:men_store/features/profile/presentation/widgets/account_logout_tile.dart';
import 'package:men_store/features/profile/presentation/widgets/account_menu_item_data.dart';
import 'package:men_store/features/profile/presentation/widgets/account_menu_section.dart';
import 'package:men_store/features/profile/presentation/widgets/account_section_divider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Future<void> _handleLogout() async {
    final confirmed = await showLogoutConfirmationDialog(context);
    if (!confirmed || !mounted) return;
    AppNavigator.pushAndRemoveUntil(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.white,

      body: SafeArea(
        child: Column(
          children: [
            const AccountAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AccountMenuSection(
                        items: [
                          AccountMenuItemData(
                            icon: Icons.inventory_2_outlined,
                            label: 'My Orders',
                          ),
                        ],
                      ),
                    ),
                    const AccountSectionDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AccountMenuSection(
                        items: [
                          AccountMenuItemData(
                            icon: Icons.badge_outlined,
                            label: 'My Details',
                          ),
                          AccountMenuItemData(
                            icon: Icons.home_outlined,
                            label: 'Address Book',
                            onTap: () {
                              AppNavigator.push(AddressScreen());
                            },
                          ),
                          AccountMenuItemData(
                            icon: Icons.help_outline_rounded,
                            label: 'FAQs',
                          ),
                          AccountMenuItemData(
                            icon: Icons.headset_mic_outlined,
                            label: 'Help Center',
                          ),
                        ],
                      ),
                    ),
                    const AccountSectionDivider(),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AccountLogoutTile(onTap: _handleLogout),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
