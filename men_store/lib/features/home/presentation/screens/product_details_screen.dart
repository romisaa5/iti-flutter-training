import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/home/data/models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.grey50,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductImage(),
                    const SizedBox(height: 20),
                    _buildTitleAndRating(),
                    const SizedBox(height: 12),
                    _buildDescription(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: LightAppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: LightAppColors.grey200),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: LightAppColors.neutral900,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'Details',
            style: AppTextStyles.font20Bold.copyWith(
              color: LightAppColors.neutral900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 260,
        width: double.infinity,
        color: LightAppColors.primary100,
        child: Image.network(
          product.thumbnailUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.checkroom, size: 80, color: LightAppColors.primary400),
        ),
      ),
    );
  }

  Widget _buildTitleAndRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: AppTextStyles.font20Bold.copyWith(
            color: LightAppColors.neutral900,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: LightAppColors.warning500,
              size: 20,
            ),
            const SizedBox(width: 4),
            Text(
              '4.6',
              style: AppTextStyles.font14SemiBold.copyWith(
                color: LightAppColors.neutral900,
              ),
            ),
            Text(
              '/5',
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.grey500,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '(10 reviews)',
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.grey500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text(
      product.description,
      style: AppTextStyles.font14Regular.copyWith(
        color: LightAppColors.grey700,
        height: 1.5,
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: LightAppColors.white,
        boxShadow: [
          BoxShadow(
            color: LightAppColors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: AppTextStyles.font12Regular.copyWith(
                  color: LightAppColors.grey500,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: LightAppColors.greenGradient[1]),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  product.formattedPrice,
                  style: AppTextStyles.font16Bold.copyWith(
                    color: LightAppColors.neutral900,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${product.title} added to cart')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: LightAppColors.primary600,
                  foregroundColor: LightAppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.shopping_bag_outlined, size: 20),
                label: Text(
                  'Add to Cart',
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: LightAppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
