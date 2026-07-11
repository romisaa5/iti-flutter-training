import 'package:flutter/material.dart';
import 'package:store_app/core/style/app_colors.dart';
import 'package:store_app/core/style/app_text_styles.dart';
import '../models/order_model.dart';
import '../widgets/order_tabs.dart';
import '../widgets/order_item_tile.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int _selectedTab = 1;
  final List<OrderModel> _ongoingOrders = const [
    OrderModel(
      id: '345',
      status: OrderStatus.delivered,
      date: 'October 26, 2014',
      price: 700,
    ),
  ];
  final List<OrderModel> _historyOrders = const [
    OrderModel(
      id: '345',
      status: OrderStatus.delivered,
      date: 'October 26, 2014',
      price: 700,
    ),
    OrderModel(
      id: '346',
      status: OrderStatus.cancelled,
      date: 'October 14, 2016',
      price: 452,
    ),
    OrderModel(
      id: '347',
      status: OrderStatus.delivered,
      date: 'July 26, 2017',
      price: 281,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final orders = _selectedTab == 0 ? _ongoingOrders : _historyOrders;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.secondary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Orders',
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.secondary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              OrderTabs(
                selectedIndex: _selectedTab,
                onChanged: (index) => setState(() => _selectedTab = index),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: orders.isEmpty
                    ? const Center(
                        child: Text(
                          'No orders here yet',
                          style: TextStyle(color: Color(0xFF9E9E9E)),
                        ),
                      )
                    : ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return OrderItemTile(order: orders[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
