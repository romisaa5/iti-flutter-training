import 'package:flutter/material.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/home/presentation/widgets/products_grid_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<dynamic> products;

  final ValueChanged<ProductModel> onProductTap;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 14,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductGridCard(
          product: product,
          onTap: () => onProductTap(product),
        );
      },
    );
  }
}
