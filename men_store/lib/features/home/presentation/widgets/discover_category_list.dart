import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:men_store/features/home/presentation/cubit/products_cubit.dart';
import 'package:men_store/features/home/presentation/widgets/category_chip.dart';

class DiscoverCategoryList extends StatelessWidget {
  const DiscoverCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) => current is ProductsSuccess,
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        final categories = cubit.categories;
        if (categories.length <= 1) return const SizedBox(height: 40);

        return SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryChip(
                label: category,
                isSelected: cubit.selectedCategory == category,
                onTap: () => cubit.filterByCategory(category),
              );
            },
          ),
        );
      },
    );
  }
}
