import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';

class SearchNoResultsView extends StatelessWidget {
  final String query;

  const SearchNoResultsView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 40,
            color: LightAppColors.grey400,
          ),
          const SizedBox(height: 12),
          Text(
            'No results found for "$query"',
            textAlign: TextAlign.center,
            style: AppTextStyles.font14Regular.copyWith(
              color: LightAppColors.grey500,
            ),
          ),
        ],
      ),
    );
  }
}
