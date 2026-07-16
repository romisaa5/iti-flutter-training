// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
// import 'package:iti_final_project/features/home/presentation/screens/product_details_screen.dart';
// import 'package:iti_final_project/features/home/presentation/widgets/products_grid.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => SearchCubit(ProductsRepo(ApiService())),
//       child: const _SearchView(),
//     );
//   }
// }

// class _SearchView extends StatefulWidget {
//   const _SearchView();

//   @override
//   State<_SearchView> createState() => _SearchViewState();
// }

// class _SearchViewState extends State<_SearchView> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onSuggestionTap(String label) {
//     _controller.text = label;
//     context.read<SearchCubit>().search(label);
//   }

//   void _onClear() {
//     _controller.clear();
//     context.read<SearchCubit>().onQueryChanged('');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: LightAppColors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               SearchInputBar(
//                 controller: _controller,
//                 onChanged: (query) =>
//                     context.read<SearchCubit>().onQueryChanged(query),
//                 onClear: _onClear,
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: BlocBuilder<SearchCubit, SearchState>(
//                   builder: (context, state) {
//                     return switch (state) {
//                       SearchIdle() => SearchSuggestionChips(
//                         onSuggestionTap: _onSuggestionTap,
//                       ),
//                       SearchLoading() => const Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                       SearchFailure(:final message) => Center(
//                         child: Text(message),
//                       ),
//                       SearchLoaded(:final query, :final results) =>
//                         results.isEmpty
//                             ? SearchNoResultsView(query: query)
//                             : Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SearchResultsHeader(
//                                     query: query,
//                                     count: results.length,
//                                   ),
//                                   const SizedBox(height: 16),
//                                   Expanded(
//                                     child: ProductsGrid(
//                                       products: results,
//                                       onProductTap: (product) {
//                                         Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                             builder: (_) =>
//                                                 ProductDetailsScreen(
//                                                   product: product,
//                                                 ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                     };
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
