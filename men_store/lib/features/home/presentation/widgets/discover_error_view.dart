import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/home/presentation/cubit/products_cubit.dart';

class DiscoverErrorView extends StatelessWidget {
  final String message;

  const DiscoverErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off_rounded, size: 40, color: LightAppColors.grey400),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.font14Regular.copyWith(
              color: LightAppColors.grey700,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.read<ProductsCubit>().getProducts(),
            style: ElevatedButton.styleFrom(
              backgroundColor: LightAppColors.primary600,
            ),
            child: Text(
              'Retry',
              style: AppTextStyles.font14SemiBold.copyWith(
                color: LightAppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
