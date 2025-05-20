
import 'package:yummy_app/core/model/food_category.dart';
import 'package:yummy_app/core/model/post.dart';
import 'package:yummy_app/core/model/restaurant.dart';

class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> friendPosts;

  ExploreData(this.restaurants, this.categories, this.friendPosts);
}

class MockYummyService {
  Future<ExploreData> getExploreData() async {
    final categories = await _getCategories();
    final friendPosts = await _getFriendFeed();
    final restaurants = await _getRestaurants();


    return ExploreData(restaurants, categories, friendPosts);
  }

  Future<List<FoodCategory>> _getCategories() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return categories;
  }

  Future<List<Post>> _getFriendFeed() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return posts;
  }

  Future<List<Restaurant>> _getRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return restaurants;
  }
}
