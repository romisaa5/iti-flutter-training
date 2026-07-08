import 'package:flutter/material.dart';
import 'package:store_app/core/style/app_colors.dart';
import 'package:store_app/core/style/app_text_styles.dart';
import '../widgets/profile_menu_item.dart';
import '../widgets/profile_section_label.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.secondary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.secondary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ProfileMenuItem(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.vpn_key_outlined,
                title: 'Change Password',
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.credit_card,
                title: 'My Cards',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              const ProfileSectionLabel(label: 'App Settings'),
              ProfileMenuItem(
                icon: Icons.notifications_none,
                title: 'Notifications',
                trailing: Switch(
                  value: _notificationsOn,
                  activeThumbColor: Colors.white,
                  activeTrackColor: const Color(0xFFFF7A1A),
                  onChanged: (value) =>
                      setState(() => _notificationsOn = value),
                ),
              ),
              ProfileMenuItem(
                icon: Icons.translate,
                title: 'Language',
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'English',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xFFBDBDBD),
                      size: 20,
                    ),
                  ],
                ),
                onTap: () {},
              ),
              ProfileMenuItem(
                icon: Icons.logout,
                title: 'Logout',
                showChevronByDefault: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
