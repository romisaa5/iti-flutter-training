import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store/core/di/service_locater.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/features/home/presentation/cubit/products_cubit.dart';
import 'package:men_store/features/home/presentation/widgets/discover_body.dart';
import 'package:men_store/features/home/presentation/widgets/discover_category_list.dart';
import 'package:men_store/features/home/presentation/widgets/discover_search_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsCubit>()..getProducts(),
      child: const _DiscoverView(),
    );
  }
}

class _DiscoverView extends StatefulWidget {
  const _DiscoverView();

  @override
  State<_DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<_DiscoverView> {
  int currentNavIndex = 0;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.grey0,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Discover',
                style: AppTextStyles.font28Bold.copyWith(
                  color: LightAppColors.neutral900,
                ),
              ),
              const SizedBox(height: 16),
              DiscoverSearchBar(controller: searchController),
              const SizedBox(height: 16),
              const DiscoverCategoryList(),
              const SizedBox(height: 16),
              const Expanded(child: DiscoverBody()),
            ],
          ),
        ),
      ),
    );
  }
}
