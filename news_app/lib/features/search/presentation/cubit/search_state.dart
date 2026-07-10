import 'package:news_app/features/home/data/models/news_response.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ArticleModel> articles;

  SearchSuccess(this.articles);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
