import 'package:flutter/material.dart';
import 'package:yummy_app/features/api/mock_yummy_service.dart';
import 'package:yummy_app/features/components/categories_section.dart';
import 'package:yummy_app/features/components/post_section.dart';
import 'package:yummy_app/features/components/restaurant_section.dart';

class ExploreView extends StatelessWidget {
  final MockYummyService mockYummyService = MockYummyService();

  ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockYummyService.getExploreData(),
        builder: (context, state) {
          final restaurantItems = state.data?.restaurants ?? [];
          final categoriesItems = state.data?.categories ?? [];
          final postsItems = state.data?.friendPosts ?? [];
          if (state.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              RestaurantSection(
                restaurants: restaurantItems,
              ),
              CategoriesSection(
                categories: categoriesItems,
              ),
              PostSection(
                posts: postsItems,
              )
            ],
          );
        });
  }
}
