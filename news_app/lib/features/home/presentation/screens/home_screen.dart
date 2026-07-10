import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/features/home/presentation/screens/details_screen.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/breaking_news_section.dart';
import '../widgets/category_filter_tabs.dart';
import '../widgets/custom_top_bar.dart';
import '../widgets/news_list_item.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            if (state is HomeSuccess) {
              final articles = state.news.articles;

              return ListView(
                padding: const EdgeInsets.only(bottom: 24),
                children: [
                  const CustomTopBar(),
                  const SizedBox(height: 8),

                  BreakingNewsSection(),

                  CategoryFilterTabs(onCategorySelected: (category) {}),

                  const SectionHeader(title: 'News For You'),
                  const SizedBox(height: 4),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];

                        return NewsListItem(
                          article: article,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                model: state.news.articles[index + 1],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
