class AddToCartProductItem {
  final int id;
  final int quantity;

  const AddToCartProductItem({required this.id, required this.quantity});

  Map<String, dynamic> toJson() => {'id': id, 'quantity': quantity};
}

class AddToCartRequestModel {
  final int userId;
  final List<AddToCartProductItem> products;

  const AddToCartRequestModel({required this.userId, required this.products});
  factory AddToCartRequestModel.singleProduct({
    required int userId,
    required int productId,
    required int quantity,
  }) => AddToCartRequestModel(
    userId: userId,
    products: [AddToCartProductItem(id: productId, quantity: quantity)],
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'products': products.map((p) => p.toJson()).toList(),
  };
}
