import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_state.dart';
import 'package:men_store/features/cart/presentation/widgets/cart_error_view.dart';
import 'package:men_store/features/cart/presentation/widgets/cart_item_card.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartInitial() || CartLoading() => Center(
            child: CircularProgressIndicator(color: LightAppColors.primary600),
          ),
          CartFailure(:final message) => CartErrorView(message: message),
          CartLoaded(:final cart) when cart.isEmpty => _EmptyCart(),
          CartLoaded(:final cart) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: cart.products.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) =>
                CartItemCard(item: cart.products[index]),
          ),
        };
      },
    );
  }
}

class _EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 40,
            color: LightAppColors.grey400,
          ),
          const SizedBox(height: 12),
          Text(
            'Your cart is empty',
            style: AppTextStyles.font14Regular.copyWith(
              color: LightAppColors.grey500,
            ),
          ),
        ],
      ),
    );
  }
}
