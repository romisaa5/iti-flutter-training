import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/home/presentation/screens/product_details_screen.dart';
import 'package:iti_final_project/features/home/presentation/widgets/back_app_bar.dart';
import 'package:iti_final_project/features/home/presentation/widgets/products_grid.dart';

class ProductsListScreen extends StatelessWidget {
  final List<ProductModel> products;
  final String title;

  const ProductsListScreen({
    super.key,
    required this.products,
    this.title = 'Products',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SimpleBackAppBar(title: title),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProductsGrid(
                  products: products,
                  onProductTap: (product) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
