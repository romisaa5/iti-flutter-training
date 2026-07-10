import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconButton(Icons.menu),
          Row(
            children: [
              _iconButton(Icons.search),
              const SizedBox(width: 8),
              _iconButton(Icons.notifications_none_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(icon, color: AppColors.textDark, size: 24),
        ),
      ),
    );
  }
}
