import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class CategoryFilterTabs extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<String>? onCategorySelected;

  const CategoryFilterTabs({
    super.key,
    this.categories = const ['All', 'Politic', 'Sport', 'Education'],
    this.onCategorySelected,
  });

  @override
  State<CategoryFilterTabs> createState() => _CategoryFilterTabsState();
}

class _CategoryFilterTabsState extends State<CategoryFilterTabs> {
  late String _selected = widget.categories.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.categories.map((category) {
            final bool isSelected = category == _selected;
            return GestureDetector(
              onTap: () {
                setState(() => _selected = category);
                widget.onCategorySelected?.call(category);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryOrange : AppColors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryOrange
                        : AppColors.textDark.withValues(alpha: .7),
                  ),
                ),
                child: Text(
                  category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? AppColors.white : AppColors.textDark,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
