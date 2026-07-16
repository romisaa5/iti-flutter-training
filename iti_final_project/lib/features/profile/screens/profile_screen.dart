import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/helpers/app_navigator.dart';
import 'package:iti_final_project/core/network/token_storage.dart';
import 'package:iti_final_project/features/login/presentation/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String? avatarUrl;

  const ProfileScreen({super.key, required this.userName, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              30.verticalSpace,
              CircleAvatar(
                radius: 45.r,
                backgroundColor: Colors.grey[300],
                backgroundImage: avatarUrl != null
                    ? NetworkImage(avatarUrl!)
                    : null,
                child: avatarUrl == null
                    ? Icon(Icons.person, size: 50.r, color: Colors.grey[600])
                    : null,
              ),
              12.verticalSpace,
              Text(
                userName,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              30.verticalSpace,
              _ProfileTile(
                icon: Icons.person_outline,
                title: 'Profile',
                onTap: () {},
              ),
              12.verticalSpace,
              _ProfileTile(
                icon: Icons.settings_outlined,
                title: 'Setting',
                onTap: () {},
              ),
              12.verticalSpace,
              _ProfileTile(
                icon: Icons.mail_outline,
                title: 'Contact',
                onTap: () {},
              ),
              12.verticalSpace,
              _ProfileTile(
                icon: Icons.share_outlined,
                title: 'Share App',
                onTap: () {},
              ),
              12.verticalSpace,
              _ProfileTile(
                icon: Icons.help_outline,
                title: 'Help',
                onTap: () {},
              ),
              const Spacer(),
              TextButton(
                onPressed: () async {
                  await TokenStorage.deleteToken();
                  AppNavigator.pushAndRemoveUntil(const LoginScreen());
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20.r, color: Colors.black87),
            12.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Icon(Icons.chevron_right, size: 20.r, color: Colors.black38),
          ],
        ),
      ),
    );
  }
}
