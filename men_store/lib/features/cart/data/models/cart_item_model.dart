class CartProductModel {
  final int id;
  final String title;
  final num price;
  final int quantity;
  final num total;
  final num discountPercentage;
  final num discountedTotal;
  final String thumbnail;

  const CartProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        id: json['id'] as int? ?? 0,
        title: json['title'] as String? ?? '',
        price: json['price'] as num? ?? 0,
        quantity: json['quantity'] as int? ?? 1,
        total: json['total'] as num? ?? 0,
        discountPercentage: json['discountPercentage'] as num? ?? 0,
        discountedTotal: json['discountedTotal'] as num? ?? 0,
        thumbnail: json['thumbnail'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'quantity': quantity,
    'total': total,
    'discountPercentage': discountPercentage,
    'discountedTotal': discountedTotal,
    'thumbnail': thumbnail,
  };

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  String get formattedDiscountedTotal =>
      '\$${discountedTotal.toStringAsFixed(2)}';

  bool get hasDiscount => discountPercentage > 0;

  /// Recomputes [total] and [discountedTotal] for a new quantity, keeping
  /// the same unit price and discount percentage — used for local
  /// increment/decrement without another round trip to the API.
  CartProductModel copyWithQuantity(int newQuantity) {
    final newTotal = price * newQuantity;
    final newDiscountedTotal = newTotal - (newTotal * discountPercentage / 100);
    return CartProductModel(
      id: id,
      title: title,
      price: price,
      quantity: newQuantity,
      total: newTotal,
      discountPercentage: discountPercentage,
      discountedTotal: newDiscountedTotal,
      thumbnail: thumbnail,
    );
  }
}

class CartModel {
  final int id;
  final List<CartProductModel> products;
  final num total;
  final num discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  const CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json['id'] as int? ?? 0,
    products: (json['products'] as List<dynamic>? ?? [])
        .map(
          (product) =>
              CartProductModel.fromJson(product as Map<String, dynamic>),
        )
        .toList(),
    total: json['total'] as num? ?? 0,
    discountedTotal: json['discountedTotal'] as num? ?? 0,
    userId: json['userId'] as int? ?? 0,
    totalProducts: json['totalProducts'] as int? ?? 0,
    totalQuantity: json['totalQuantity'] as int? ?? 0,
  );

  factory CartModel.empty() => const CartModel(
    id: 0,
    products: [],
    total: 0,
    discountedTotal: 0,
    userId: 0,
    totalProducts: 0,
    totalQuantity: 0,
  );

  bool get isEmpty => products.isEmpty;

  /// How much the discount saved on this cart.
  num get savings => total - discountedTotal;

  /// Returns a new [CartModel] with cart-level totals recomputed from
  /// [newProducts]. Call this after a local quantity change or removal so
  /// the UI stays in sync without hitting the API again.
  CartModel updateProducts(List<CartProductModel> newProducts) {
    final newTotal = newProducts.fold<num>(0, (sum, p) => sum + p.total);
    final newDiscountedTotal = newProducts.fold<num>(
      0,
      (sum, p) => sum + p.discountedTotal,
    );
    final newTotalQuantity = newProducts.fold<int>(
      0,
      (sum, p) => sum + p.quantity,
    );

    return CartModel(
      id: id,
      products: newProducts,
      total: newTotal,
      discountedTotal: newDiscountedTotal,
      userId: userId,
      totalProducts: newProducts.length,
      totalQuantity: newTotalQuantity,
    );
  }
}
