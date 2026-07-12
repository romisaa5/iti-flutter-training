import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store/features/cart/data/repos/cart_repo.dart';
import 'package:men_store/features/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(const CartInitial());

  int? _lastUserId;

  Future<void> getCart(int userId) async {
    _lastUserId = userId;
    emit(const CartLoading());

    try {
      final cart = await cartRepo.getUserCart(userId);
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  void retry() {
    if (_lastUserId != null) getCart(_lastUserId!);
  }

  void increment(int productId) {
    _updateQuantity(productId, (current) => current + 1);
  }

  void decrement(int productId) {
    _updateQuantity(productId, (current) => current > 1 ? current - 1 : 1);
  }

  void removeItem(int productId) {
    final currentState = state;
    if (currentState is! CartLoaded) return;
    final updatedProducts = currentState.cart.products
        .where((product) => product.id != productId)
        .toList();
    emit(CartLoaded(currentState.cart.updateProducts(updatedProducts)));
  }

  void _updateQuantity(int productId, int Function(int current) update) {
    final currentState = state;
    if (currentState is! CartLoaded) return;
    final updatedProducts = currentState.cart.products.map((product) {
      if (product.id != productId) return product;
      return product.copyWithQuantity(update(product.quantity));
    }).toList();
    emit(CartLoaded(currentState.cart.updateProducts(updatedProducts)));
  }
}
