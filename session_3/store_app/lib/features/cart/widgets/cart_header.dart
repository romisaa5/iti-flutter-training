import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  final VoidCallback onBack;

  const CartHeader({super.key, required this.onBack});

  static const Color accent = Color(0xFFFF7A1A);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Cart',
            style: TextStyle(
              color: accent,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Positioned(
            left: 4,
            child: IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.chevron_left, color: accent, size: 28),
            ),
          ),
        ],
      ),
    );
  }
}
