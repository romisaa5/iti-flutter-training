import 'package:news_app/features/home/data/models/news_response.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final NewsResponse news;

  HomeSuccess(this.news);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
