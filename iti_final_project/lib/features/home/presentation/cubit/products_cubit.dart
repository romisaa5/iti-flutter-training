import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/features/home/data/models/product_model.dart';
import 'package:iti_final_project/features/home/data/repo/products_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(const ProductsInitial());

  Future<void> getProducts() async {
    emit(const ProductsLoading());

    try {
      final products = await productsRepo.getProducts();
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}
