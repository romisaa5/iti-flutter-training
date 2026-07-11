enum OrderStatus { delivered, cancelled }

class OrderModel {
  final String id;
  final OrderStatus status;
  final String date;
  final double price;

  const OrderModel({
    required this.id,
    required this.status,
    required this.date,
    required this.price,
  });
}
