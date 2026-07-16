import 'package:iti_final_project/features/search/data/models/search_ptoduct_model.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchIdle extends SearchState {
  const SearchIdle();
}

final class SearchLoading extends SearchState {
  final String query;
  const SearchLoading(this.query);
}

final class SearchLoaded extends SearchState {
  final String query;
  final List<SearchProductModel> results;
  const SearchLoaded({required this.query, required this.results});
}

final class SearchFailure extends SearchState {
  final String query;
  final String message;
  const SearchFailure({required this.query, required this.message});
}
