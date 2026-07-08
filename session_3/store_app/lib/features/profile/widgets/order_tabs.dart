import 'package:flutter/material.dart';

class OrderTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const OrderTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  static const Color accent = Color(0xFFFF7A1A);
  static const List<String> _labels = ['Ongoing', 'History'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_labels.length, (index) {
        final bool selected = index == selectedIndex;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () => onChanged(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _labels[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: selected ? accent : const Color(0xFF9E9E9E),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2,
                  width: 60,
                  color: selected ? accent : Colors.transparent,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
