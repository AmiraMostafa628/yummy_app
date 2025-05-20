import 'package:flutter/material.dart';
import 'package:yummy_app/core/model/food_category.dart';
import 'package:yummy_app/features/components/categories_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.categories});

  final List<FoodCategory> categories;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                width: 150.0,
                child: CategoriesItem(category: categories[index],
                   
                ),
              ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}