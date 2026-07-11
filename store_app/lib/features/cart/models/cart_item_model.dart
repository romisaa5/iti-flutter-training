class CartItemModel {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final String unit;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.unit,
    this.quantity = 1,
  });
}
