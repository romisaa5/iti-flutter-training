import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/home/presentation/widgets/circle_icon_button.dart';
import 'package:iti_final_project/features/home/presentation/widgets/rating_badge.dart';
import 'package:iti_final_project/features/home/presentation/widgets/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  static const List<String> _sizes = ['8', '10', '38', '40'];
  String? _selectedSize = _sizes.first;
  bool _isWishlisted = false;
  bool _isAddingToCart = false;

  Future<void> _handleBuyNow() => _addToCart();
  Future<void> _handleAddToBag() => _addToCart();

  Future<void> _addToCart() async {
    // setState(() => _isAddingToCart = true);
    // await getIt<CartCubit>().addToCart(productId: widget.product.id);
    // if (!mounted) return;
    // setState(() => _isAddingToCart = false);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('${widget.product.title} added to cart')),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: LightAppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(product),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitleAndPrice(product),
                          const SizedBox(height: 8),
                          const RatingBadge(rating: 4.5, reviewCount: 20),
                          const SizedBox(height: 20),
                          Text(
                            'Description',
                            style: AppTextStyles.font16Bold.copyWith(
                              color: LightAppColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.description,
                            style: AppTextStyles.font14Regular.copyWith(
                              color: LightAppColors.grey700,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Size',
                            style: AppTextStyles.font16Bold.copyWith(
                              color: LightAppColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizeSelector(
                            sizes: _sizes,
                            selectedSize: _selectedSize,
                            onSizeSelected: (size) =>
                                setState(() => _selectedSize = size),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(ProductModel product) {
    return Stack(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          color: LightAppColors.grey100,
          child: Image.network(
            product.thumbnailUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.image_not_supported_outlined,
              size: 60,
              color: LightAppColors.grey400,
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIconButton(
                  icon: Icons.arrow_back_rounded,
                  onTap: () => Navigator.of(context).pop(),
                ),
                CircleIconButton(
                  icon: _isWishlisted
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  iconColor: _isWishlisted ? LightAppColors.error500 : null,
                  onTap: () => setState(() => _isWishlisted = !_isWishlisted),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndPrice(ProductModel product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            product.title,
            style: AppTextStyles.font18Bold.copyWith(
              color: LightAppColors.neutral900,
            ),
          ),
        ),
        Text(
          product.formattedPrice,
          style: AppTextStyles.font18Bold.copyWith(
            color: LightAppColors.primary600,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
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
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: _isAddingToCart ? null : _handleBuyNow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: LightAppColors.primary600,
                  foregroundColor: LightAppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: _isAddingToCart
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: LightAppColors.white,
                        ),
                      )
                    : Text(
                        'Buy Now',
                        style: AppTextStyles.font16SemiBold.copyWith(
                          color: LightAppColors.white,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _isAddingToCart ? null : _handleAddToBag,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: LightAppColors.grey50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: LightAppColors.grey200),
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: LightAppColors.neutral900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
