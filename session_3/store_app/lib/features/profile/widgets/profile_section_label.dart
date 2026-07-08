import 'package:flutter/material.dart';
import 'package:store_app/core/style/app_colors.dart';

class ProfileSectionLabel extends StatelessWidget {
  final String label;

  const ProfileSectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}
