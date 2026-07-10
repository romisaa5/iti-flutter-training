import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onShowMoreTap;

  const SectionHeader({super.key, required this.title, this.onShowMoreTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          TextButton(
            onPressed: onShowMoreTap ?? () {},
            child: const Text(
              'Show More',
              style: TextStyle(
                color: Color(0xff2C57F0),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
