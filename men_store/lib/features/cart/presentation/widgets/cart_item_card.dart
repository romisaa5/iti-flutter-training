import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/cart/data/models/cart_item_model.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:men_store/features/cart/presentation/widgets/cart_quantity_stepper.dart';

class CartItemCard extends StatelessWidget {
  final CartProductModel item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: LightAppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: LightAppColors.grey200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 56,
              height: 56,
              color: LightAppColors.primary100,
              child: Image.network(
                item.thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.shopping_bag_outlined,
                  color: LightAppColors.primary400,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.font14SemiBold.copyWith(
                          color: LightAppColors.neutral900,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cubit.removeItem(item.id),
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: LightAppColors.error500,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                // if (item.hasDiscount) ...[
                //   const SizedBox(height: 2),
                //   Text(
                //     '${item.discountPercentage.toStringAsFixed(0)}% off',
                //     style: AppTextStyles.font12Regular.copyWith(
                //       color: LightAppColors.greenGradient[1],
                //     ),
                //   ),
                // ],
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.formattedDiscountedTotal,
                          style: AppTextStyles.font16Bold.copyWith(
                            color: LightAppColors.neutral900,
                          ),
                        ),
                        // if (item.hasDiscount)
                        //   Text(
                        //     '\$${item.total.toStringAsFixed(2)}',
                        //     style: AppTextStyles.font12Regular.copyWith(
                        //       color: LightAppColors.grey500,
                        //       decoration: TextDecoration.lineThrough,
                        //     ),
                        //   ),
                      ],
                    ),
                    CartQuantityStepper(
                      quantity: item.quantity,
                      onIncrement: () => cubit.increment(item.id),
                      onDecrement: () => cubit.decrement(item.id),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
