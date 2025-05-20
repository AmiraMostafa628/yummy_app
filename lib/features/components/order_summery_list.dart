import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/features/components/order_summery_item.dart';

class OrderSummeryList extends StatelessWidget {
  const OrderSummeryList({super.key, required this.cartManager});

  final CartManager cartManager;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: cartManager.items.length,
        separatorBuilder: (context, index) => SizedBox(
          height: 15.0,
        ),
        itemBuilder: (context, index) => OrderSummeryItem(
          item: cartManager.items[index],
        ),
      ),
    );
  }
}