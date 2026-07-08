import 'package:flutter/material.dart';
import '../models/order_model.dart';

class OrderItemTile extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;

  const OrderItemTile({super.key, required this.order, this.onTap});

  static const Color accent = Color(0xFFFF7A1A);
  static const Color darkText = Color(0xFF2B2B2B);

  Color get _statusColor => order.status == OrderStatus.delivered
      ? const Color(0xFF3DBE64)
      : const Color(0xFFE53935);

  String get _statusLabel =>
      order.status == OrderStatus.delivered ? 'Delivered' : 'Cancelled';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: accent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_basket_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #${order.id}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _statusLabel,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _statusColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    order.date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$${order.price.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
