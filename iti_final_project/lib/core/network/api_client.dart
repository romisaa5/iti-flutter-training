import 'package:dio/dio.dart';
import 'package:iti_final_project/core/network/dio_helper.dart';
import 'package:iti_final_project/features/login/data/models/login_request_model.dart';

class ApiService {
  Future<Response> login(LoginRequestModel request) async {
    return await DioHelper.post('auth/login', data: request.toJson());
  }

  Future<Response> getProducts() async {
    return await DioHelper.get('products');
  }

  Future<Response> searchProducts(String query) async {
    final dio = Dio();
    return await dio.get(
      'https://dummyjson.com/products/search',
      queryParameters: {'q': query},
    );
  }
}
