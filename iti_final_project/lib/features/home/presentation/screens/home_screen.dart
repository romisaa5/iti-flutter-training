import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/core/di/service_locater.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/home/presentation/cubit/products_cubit.dart';
import 'package:iti_final_project/features/home/presentation/screens/product_details_screen.dart';
import 'package:iti_final_project/features/home/presentation/screens/products_list_screen.dart';
import 'package:iti_final_project/features/home/presentation/screens/search_screen.dart';
import 'package:iti_final_project/features/home/presentation/widgets/home_banner.dart';
import 'package:iti_final_project/features/home/presentation/widgets/home_error_view.dart';
import 'package:iti_final_project/features/home/presentation/widgets/home_header.dart';
import 'package:iti_final_project/features/home/presentation/widgets/home_loading_view.dart';
import 'package:iti_final_project/features/home/presentation/widgets/home_products_row.dart';
import 'package:iti_final_project/features/home/presentation/widgets/home_search_app_bar.dart';
import 'package:iti_final_project/features/home/presentation/widgets/home_section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..getProducts(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  int currentNavIndex = 0;

  void _openProductDetails(ProductModel product) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: product)),
    );
  }

  void _openSearch() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const SearchScreen()));
  }

  void _openAllProducts(List<ProductModel> allProducts) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProductsListScreen(products: allProducts),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  const HomeHeader(userName: 'John William'),
                  const SizedBox(height: 16),
                  HomeSearchBar(onTap: _openSearch),
                  const SizedBox(height: 20),
                  Expanded(
                    child: switch (state) {
                      ProductsInitial() ||
                      ProductsLoading() => const HomeLoadingView(),
                      ProductsFailure(:final message) => HomeErrorView(
                        message: message,
                        onRetry: () =>
                            context.read<ProductsCubit>().getProducts(),
                      ),
                      ProductsSuccess() => _buildContent(state),
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ProductsSuccess state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeBannerCarousel(),
          const SizedBox(height: 24),
          HomeSectionHeader(
            title: 'Featured',
            onSeeAllTap: () => _openAllProducts(state.products),
          ),
          const SizedBox(height: 12),
          HomeProductsRow(
            products: state.products,
            onProductTap: _openProductDetails,
          ),
          const SizedBox(height: 24),
          HomeSectionHeader(
            title: 'Most Popular',
            onSeeAllTap: () => _openAllProducts(state.products),
          ),
          const SizedBox(height: 12),
          HomeProductsRow(
            products: state.products,
            onProductTap: _openProductDetails,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
