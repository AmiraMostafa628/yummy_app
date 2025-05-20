import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/food_category.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.category});

  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.0)),
              child: AspectRatio(
                aspectRatio: 2,
                  child: Image.asset(category.imageUrl,fit: BoxFit.cover,))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 12.0),
            child: Text(
              category.name,
              style: textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('${category.numberOfRestaurants} places',
                style: textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
