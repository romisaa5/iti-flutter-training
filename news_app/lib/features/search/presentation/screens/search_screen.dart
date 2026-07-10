import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/screens/details_screen.dart';
import 'package:news_app/features/home/presentation/widgets/news_list_item.dart';
import 'package:news_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:news_app/features/search/presentation/cubit/search_state.dart';
import 'package:news_app/features/search/presentation/widgets/app_input.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final contoller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().clearList();
  }

  @override
  void dispose() {
    contoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppInput(
                    controller: contoller,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        return;
                      }
                      context.read<SearchCubit>().searchNews(value);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<SearchCubit>().searchNews(
                      contoller.text.trim(),
                    );
                  },
                  child: Text('search', style: TextStyle()),
                ),
              ],
            ),
            SizedBox(height: 10),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccess) {
                  if (contoller.text.isEmpty) {
                    return const Center(
                      child: Text(
                        'Search Now',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  if (state.articles.isEmpty) {
                    return const Center(child: Text('No Results Found'));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) {
                      return NewsListItem(
                        article: state.articles[index],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(model: state.articles[index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
