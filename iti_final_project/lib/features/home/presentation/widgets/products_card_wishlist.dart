import 'package:flutter/material.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';

class ProductCardWishlist extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCardWishlist({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ProductCardWishlist> createState() => _ProductCardWishlistState();
}

class _ProductCardWishlistState extends State<ProductCardWishlist> {
  // Local-only UI state — there's no wishlist endpoint to persist this to.
  bool _isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: 130,
                    height: 110,
                    color: LightAppColors.grey100,
                    child: Image.network(
                      widget.product.thumbnailUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image_not_supported_outlined,
                        color: LightAppColors.grey400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => setState(() => _isWishlisted = !_isWishlisted),
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isWishlisted
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 14,
                        color: _isWishlisted
                            ? LightAppColors.error500
                            : LightAppColors.neutral800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font14Regular.copyWith(
                color: LightAppColors.neutral900,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.product.formattedPrice,
              style: AppTextStyles.font14SemiBold.copyWith(
                color: LightAppColors.primary600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
