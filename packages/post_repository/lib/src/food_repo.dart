import 'models/models.dart';

abstract class FoodRepository {
  //food create
  Future<PostFood> createFood(PostFood food);

  //get food
  Future<List<PostFood>> getFood();
}
