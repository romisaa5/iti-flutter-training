import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/home/presentation/screens/discover_screen.dart';
import 'package:men_store/features/cart/presentation/screens/cart_screen.dart';
import 'package:men_store/features/profile/presentation/screens/profile_screen.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DiscoverScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  final List<({IconData icon, String label})> _items = const [
    (icon: Icons.home_rounded, label: 'Home'),
    (icon: Icons.shopping_cart_outlined, label: 'Cart'),
    (icon: Icons.person_outline_rounded, label: 'Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: LightAppColors.white,
          boxShadow: [
            BoxShadow(
              color: LightAppColors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_items.length, (index) {
              final isSelected = index == _currentIndex;
              final item = _items[index];
              final color = isSelected
                  ? LightAppColors.primary600
                  : LightAppColors.grey500;
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(item.icon, color: color, size: 24),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: AppTextStyles.font12Regular.copyWith(color: color),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
