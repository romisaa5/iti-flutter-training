import 'package:men_store/features/cart/data/models/cart_item_model.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {
  const CartInitial();
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartLoaded extends CartState {
  final CartModel cart;
  const CartLoaded(this.cart);
}

final class CartFailure extends CartState {
  final String message;
  const CartFailure(this.message);
}
