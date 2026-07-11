import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/home/presentation/screens/product_details_screen.dart';
import 'package:men_store/features/home/presentation/widgets/product_grid_Item.dart';

class DiscoverProductGrid extends StatelessWidget {
  final List products;

  const DiscoverProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Text(
          'No products in this category',
          style: AppTextStyles.font14Regular.copyWith(
            color: LightAppColors.grey500,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductGridItem(
          product: product,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductDetailsScreen(product: product),
              ),
            );
          },
        );
      },
    );
  }
}
