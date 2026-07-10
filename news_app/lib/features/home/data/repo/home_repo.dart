import 'package:news_app/core/network/api_service.dart';

import '../models/news_response.dart';

class HomeRepo {
  final HomeApiService api;

  HomeRepo(this.api);

  Future<NewsResponse> getNews() async {
    final response = await api.getTopHeadlines();

    return NewsResponse.fromJson(response.data);
  }

  Future<NewsResponse> searchNews(String query) async {
    final response = await api.getSearchResults(query);

    return NewsResponse.fromJson(response.data);
  }
}
