import 'package:dio/dio.dart';
import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/features/cart/data/models/cart_item_model.dart';

class CartRepo {
  final ApiService apiService;

  const CartRepo(this.apiService);

  Future<CartModel> getUserCart(int userId) async {
    try {
      final response = await apiService.getUserCart(userId);
      final data = response.data as Map<String, dynamic>;
      final cartsJson = data['carts'] as List<dynamic>? ?? [];
      final cart = cartsJson.isNotEmpty
          ? CartModel.fromJson(cartsJson.first as Map<String, dynamic>)
          : CartModel.empty();
      return cart;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Failed to fetch cart';
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }
}
