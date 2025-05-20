import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/cart_manager.dart';
import 'package:yummy_app/core/model/restaurant.dart';
import 'package:yummy_app/features/components/custom_bottom_sheet.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.item,
    required this.cartManager,
    required this.onTapAddToCart,
  });

  final Item item;
  final CartManager cartManager;
  final VoidCallback onTapAddToCart;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                item: item,
                cartManager: cartManager,
                onTapAddToCart: onTapAddToCart,
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          spacing: 10.0,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: textTheme.headlineSmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textTheme.bodyMedium,
                  ),
                  Row(
                    spacing: 10.0,
                    children: [
                      Text(
                        item.price.toString(),
                      ),
                      Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    item.imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -8.0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Text('Add'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
