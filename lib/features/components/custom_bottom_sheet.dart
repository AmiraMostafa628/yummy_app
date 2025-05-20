import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/core/model/restaurant.dart';
import 'package:yummy_app/features/components/cart_container.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.item, required this.cartManager, required this.onTapAddToCart,
  });

  final Item item;
  final CartManager cartManager;
  final VoidCallback onTapAddToCart;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name,
              style: textTheme.headlineSmall,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(8.0)
              ),
              child: Text('#1 Most Liked'),
            ),
            Text(item.description,
            ),
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: NetworkImage(item.imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
            CartContainer(
              cartManager: cartManager,
              item: item,
              onTapAddToCart: onTapAddToCart,
            ),

          ],
        ),
      ),
    );
  }
}



