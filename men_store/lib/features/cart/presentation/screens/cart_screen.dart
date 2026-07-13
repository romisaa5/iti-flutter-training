import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/widgets/app_button.dart';
import 'package:men_store/features/cart/data/repos/cart_repo.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:men_store/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:men_store/features/cart/presentation/widgets/cart_items_list.dart';
import 'package:men_store/features/cart/presentation/widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  final int userId;

  const CartScreen({super.key, this.userId = 1});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(CartRepo(ApiService()))..getCart(userId),
      child: const _CartView(),
    );
  }
}

class _CartView extends StatelessWidget {
  const _CartView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.grey0,
      body: SafeArea(
        child: Column(
          children: [
            const CartAppBar(),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CartItemsList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  const CartSummary(),
                  const SizedBox(height: 16),
                  AppButton(text: 'Checkout', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
