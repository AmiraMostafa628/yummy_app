import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/core/model/restaurant.dart';

class CartContainer extends StatefulWidget {
  const CartContainer(
      {super.key, required this.cartManager, required this.item, required this.onTapAddToCart});

  @override
  State<CartContainer> createState() => _CartContainerState();
  final CartManager cartManager;
  final Item item;
  final VoidCallback onTapAddToCart;
}

class _CartContainerState extends State<CartContainer> {
  int number = 1;
  var uuid = Uuid();

  void increaseNumber() {
    setState(() {
      number++;
    });
  }

  void deCreaseNumber() {
    setState(() {
      if (number > 1) {
        number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: deCreaseNumber,
          child: CircleAvatar(
              radius: 15,
              child: Icon(Icons.remove, size: 18.0,)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(number.toString()),
        ),
        GestureDetector(
          onTap: increaseNumber,
          child: CircleAvatar(
              radius: 15,
              child: Icon(Icons.add, size: 18.0,)),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            widget.cartManager.addItem(CartItem(
              id: uuid.v4(),
              name: widget.item.name,
              price: widget.item.price,
              quantity: number,
            ));
            Navigator.pop(context);
            widget.onTapAddToCart();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12.0)
            ),
            child: Text('Add to Cart',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),

      ],
    );
  }
}