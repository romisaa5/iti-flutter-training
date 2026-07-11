part of 'products_cubit.dart';

sealed class ProductsState {
  const ProductsState();
}

final class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;
  const ProductsSuccess(this.products);
}

final class ProductsFailure extends ProductsState {
  final String message;
  const ProductsFailure(this.message);
}
