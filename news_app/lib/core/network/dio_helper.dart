import 'package:dio/dio.dart';

class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );
}
