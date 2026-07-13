import 'package:dio/dio.dart';
import 'package:men_store/core/network/dio_helper.dart';
import 'package:men_store/features/home/data/models/add_to_cart_product_Item.dart';
import 'package:men_store/features/login/data/models/login_request_model.dart';

class ApiService {
  Future<Response> login(LoginRequestModel request) async {
    return await DioHelper.post('auth/login', data: request.toJson());
  }

  Future<Response> getProducts() async {
    return await DioHelper.get('products');
  }

  Future<Response> getUserCart(int userId) async {
    final dio = Dio();

    return await dio.get('https://dummyjson.com/carts/user/$userId');
  }

  Future<Response> getLocations() async {
    return await DioHelper.get('locations');
  }

  Future<Response> addToCart(AddToCartRequestModel request) async {
    final dio = Dio();
    return await dio.post(
      'https://dummyjson.com/carts/add',
      data: request.toJson(),
    );
  }
}
