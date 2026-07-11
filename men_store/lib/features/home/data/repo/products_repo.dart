import 'package:men_store/core/network/api_client.dart';
import 'package:men_store/features/home/data/models/product_model.dart';

class ProductsRepo {
  final ApiService apiService;

  const ProductsRepo(this.apiService);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await apiService.getProducts();
      final data = response.data as List<dynamic>;
      final products = data
          .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
