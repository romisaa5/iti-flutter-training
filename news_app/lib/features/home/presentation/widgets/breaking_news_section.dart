import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class BreakingNewsSection extends StatelessWidget {
  const BreakingNewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Breaking News',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              TextButton(
                onPressed: () {},
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
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/4.png',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
