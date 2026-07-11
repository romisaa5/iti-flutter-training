import 'package:flutter/material.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/home/data/models/product_model.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductGridItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: LightAppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: LightAppColors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: LightAppColors.primary100,
                  width: double.infinity,
                  child: Image.network(
                    product.thumbnailUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: LightAppColors.primary400,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.image_not_supported_outlined,
                      size: 32,
                      color: LightAppColors.primary400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font14SemiBold.copyWith(
                color: LightAppColors.neutral900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.formattedPrice,
              style: AppTextStyles.font13Regular.copyWith(
                color: LightAppColors.grey700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
