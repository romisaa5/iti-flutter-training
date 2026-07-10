import 'package:dio/dio.dart';

class HomeApiService {
  final Dio dio;

  HomeApiService(this.dio);

  Future<Response> getTopHeadlines() {
    return dio.get(
      'top-headlines',
      queryParameters: {
        'country': 'us',
        'apiKey': '0b5c8b08d3574e0594e70a2112049440',
      },
    );
  }

  Future<Response> getSearchResults(String query) {
    return dio.get(
      'everything',
      queryParameters: {
        'q': query,
        'apiKey': '0b5c8b08d3574e0594e70a2112049440',
      },
    );
  }
}
