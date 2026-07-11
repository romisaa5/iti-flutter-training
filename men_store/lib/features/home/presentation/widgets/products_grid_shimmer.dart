import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductsGridShimmer extends StatelessWidget {
  final int itemCount;

  const ProductsGridShimmer({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) => const ProductShimmerItem(),
    );
  }
}

class ProductShimmerItem extends StatelessWidget {
  const ProductShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: LightAppColors.grey200,
      highlightColor: LightAppColors.grey50,
      child: Container(
        decoration: BoxDecoration(
          color: LightAppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: LightAppColors.grey200,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 12,
              width: double.infinity,
              color: LightAppColors.grey200,
            ),
            const SizedBox(height: 8),
            Container(height: 12, width: 60, color: LightAppColors.grey200),
          ],
        ),
      ),
    );
  }
}
