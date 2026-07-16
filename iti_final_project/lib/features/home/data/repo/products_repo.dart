import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iti_final_project/core/network/api_client.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/search/data/models/search_ptoduct_model.dart';

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

  Future<List<SearchProductModel>> searchProducts(String query) async {
    try {
      final response = await apiService.searchProducts(query);

      final data = response.data as Map<String, dynamic>;
      final productsJson = data['products'] as List<dynamic>;

      return productsJson.map((e) => SearchProductModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Something went wrong');
    }
  }
}
