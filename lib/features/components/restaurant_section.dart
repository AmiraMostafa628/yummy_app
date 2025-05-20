import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/core/model/restaurant.dart';
import 'package:yummy_app/features/components/restaurant_item.dart';

class RestaurantSection extends StatelessWidget {
   RestaurantSection({super.key, required this.restaurants});

  final List<Restaurant> restaurants;
  final CartManager cartManager = CartManager();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food Near Me',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                width: 200.0,
                child: RestaurantItem(
                  restaurant: restaurants[index],
                  cartManager: cartManager,
                ),
              ),
              itemCount: restaurants.length,
            ),
          ),
        ],
      ),
    );
  }
}
