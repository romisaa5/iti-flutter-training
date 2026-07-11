import 'package:dio/dio.dart';

class HomeApiService {
  final Dio dio;

  HomeApiService(this.dio);

  Future<Response> getTopHeadlines() {
    return dio.get(
      'top-headlines',
      queryParameters: {
        'country': 'us',
        'apiKey': '6a2bfa8471a048ddab606150547fe945',
      },
    );
  }

  Future<Response> getSearchResults(String query) {
    return dio.get(
      'everything',
      queryParameters: {
        'q': query,
        'apiKey': '6a2bfa8471a048ddab606150547fe945',
      },
    );
  }
}
