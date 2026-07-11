import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/app_button.dart';
import '../models/cart_item_model.dart';
import '../widgets/cart_header.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItemModel> _items = [
    CartItemModel(
      id: '1',
      name: 'Red Apple',
      imagePath: 'assets/images/11.png',
      price: 4.99,
      unit: 'kg',
      quantity: 2,
    ),
    CartItemModel(
      id: '2',
      name: 'Orginal Banana',
      imagePath: 'assets/images/12.png',
      price: 5.99,
      unit: 'kg',
      quantity: 2,
    ),
    CartItemModel(
      id: '3',
      name: 'Avocado Bowl',
      imagePath: 'assets/images/13.png',
      price: 24,
      unit: 'st',
      quantity: 1,
    ),
    CartItemModel(
      id: '4',
      name: 'Salmon',
      imagePath: 'assets/images/14.png',
      price: 50,
      unit: 'kg',
      quantity: 2,
    ),
  ];

  void _increment(CartItemModel item) {
    setState(() => item.quantity++);
  }

  void _decrement(CartItemModel item) {
    setState(() {
      if (item.quantity > 1) item.quantity--;
    });
  }

  void _delete(CartItemModel item) {
    setState(() => _items.removeWhere((i) => i.id == item.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: AppButton(text: 'Checkout', onTap: () {}),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CartHeader(onBack: () => Navigator.maybePop(context)),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return CartItemTile(
                    item: item,
                    onIncrement: () => _increment(item),
                    onDecrement: () => _decrement(item),
                    onDelete: () => _delete(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
