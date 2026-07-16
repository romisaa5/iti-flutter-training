import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';

class SearchSuggestionChips extends StatelessWidget {
  final ValueChanged<String> onSuggestionTap;

  const SearchSuggestionChips({super.key, required this.onSuggestionTap});
  static const List<String> _suggestions = ['Sport', 'Art', 'Action'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _suggestions
          .map(
            (label) => GestureDetector(
              onTap: () => onSuggestionTap(label),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: LightAppColors.grey50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  label,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: LightAppColors.neutral800,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
