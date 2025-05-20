import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/core/model/restaurant.dart';
import 'package:yummy_app/features/screens/views/restaurant_details.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
    required this.restaurant, required this.cartManager,
  });

  final Restaurant restaurant;
  final CartManager cartManager;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>RestaurantDetails(restaurant: restaurant,cartManager: cartManager, onTapAddToCart: () {  },)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                child: AspectRatio(
                  aspectRatio: 2,
                    child: Image.asset(restaurant.imageUrl,fit: BoxFit.cover,))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 12.0),
              child: Text(
                restaurant.name,
                style: textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,bottom: 8.0,),
              child: Text(
                restaurant.attributes,
                style: textTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
