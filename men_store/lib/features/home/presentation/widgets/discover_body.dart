import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:men_store/features/home/presentation/cubit/products_cubit.dart';
import 'package:men_store/features/home/presentation/widgets/discover_error_view.dart';
import 'package:men_store/features/home/presentation/widgets/discover_product_grid.dart';
import 'package:men_store/features/home/presentation/widgets/products_grid_shimmer.dart';

class DiscoverBody extends StatelessWidget {
  const DiscoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return switch (state) {
          ProductsInitial() || ProductsLoading() => const ProductsGridShimmer(),
          ProductsSuccess(:final products) => DiscoverProductGrid(
            products: products,
          ),
          ProductsFailure(:final message) => DiscoverErrorView(
            message: message,
          ),
        };
      },
    );
  }
}
