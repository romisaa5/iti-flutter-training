import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store/features/home/data/models/product_model.dart';
import 'package:men_store/features/home/data/repo/products_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(const ProductsInitial());
  List<ProductModel> _allProducts = [];

  String selectedCategory = 'All';

  List<String> get categories => [
    'All',
    ..._allProducts.map((p) => p.category.name).toSet(),
  ];

  Future<void> getProducts() async {
    emit(const ProductsLoading());

    try {
      final products = await productsRepo.getProducts();

      _allProducts = products;

      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }

  void filterByCategory(String category) {
    if (_allProducts.isEmpty) return;
    selectedCategory = category;
    if (category == 'All') {
      emit(ProductsSuccess(_allProducts));
    } else {
      final filtered = _allProducts
          .where((p) => p.category.name == category)
          .toList();
      emit(ProductsSuccess(filtered));
    }
  }
}
