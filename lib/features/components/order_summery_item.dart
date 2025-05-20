import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/core/resources/color_manager.dart';

class OrderSummeryItem extends StatelessWidget {
  const OrderSummeryItem({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Container(
        height: 90,
        width: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: ColorManager.burgundyColor,
              width: 2,
            )),
        child: Center(
          child: Text(
            "x${item.quantity}",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      title: Text(
        item.name,
        style: textTheme.bodyLarge!.copyWith(fontSize: 19),
      ),
      subtitle: Text(
        "Price: \$ ${item.price}",
        style: textTheme.bodyMedium!.copyWith(color: Colors.black54),
      ),
    );
  }
}