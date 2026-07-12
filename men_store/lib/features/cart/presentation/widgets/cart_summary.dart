import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_state.dart';
import 'package:men_store/features/cart/presentation/widgets/cart_summary_row.dart';

class CartSummary extends StatelessWidget {
  static const num shippingFee = 80;

  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is! CartLoaded || state.cart.isEmpty) {
          return const SizedBox.shrink();
        }

        final cart = state.cart;
        final total = cart.discountedTotal + shippingFee;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartSummaryRow(
              label: 'Sub-total',
              value: '\$${cart.total.toStringAsFixed(2)}',
            ),
            if (cart.savings > 0)
              CartSummaryRow(
                label: 'Discount',
                value: '-\$${cart.savings.toStringAsFixed(2)}',
              ),
            CartSummaryRow(
              label: 'Shipping fee',
              value: '\$${shippingFee.toStringAsFixed(0)}',
            ),
            const SizedBox(height: 4),
            Divider(color: LightAppColors.grey200),
            const SizedBox(height: 4),
            CartSummaryRow(
              label: 'Total',
              value: '\$${total.toStringAsFixed(2)}',
              isBold: true,
            ),
          ],
        );
      },
    );
  }
}
