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
        discountedTotal:
            (json['discountedTotal'] ?? json['discountedPrice']) as num? ?? 0,
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
