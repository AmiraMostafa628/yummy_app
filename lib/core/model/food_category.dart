class FoodCategory {
  final String name;
  final int numberOfRestaurants;
  final String imageUrl;

  const FoodCategory(
    this.name,
    this.numberOfRestaurants,
    this.imageUrl, //
  );
}

const List<FoodCategory> categories = [
  FoodCategory('Dessert', 16, 'assets/images/categories/dessert.png'),
  FoodCategory('Vegetarian', 20, 'assets/images/categories/vegetarian.png'),
  FoodCategory('Burger', 21, 'assets/images/categories/burger.png'),
  FoodCategory('Asian', 16, 'assets/images/categories/asian.png'),
  FoodCategory('Italian', 18, 'assets/images/categories/italian.png'),
  FoodCategory('Mexican', 15, 'assets/images/categories/mexican.png'),
  FoodCategory('Seafood', 14, 'assets/images/categories/seafood.png'),
  FoodCategory('Pizza', 19, 'assets/images/categories/pizza.png'),
  FoodCategory('Sushi', 15, 'assets/images/categories/sushi.png'),
  FoodCategory('Coffee', 22, 'assets/images/categories/coffee.png'),
  FoodCategory('Fast Food', 23, 'assets/images/categories/fast_food.png'),
  FoodCategory('Salad', 18, 'assets/images/categories/salad.png'),
];
