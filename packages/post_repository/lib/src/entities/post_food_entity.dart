import 'package:equatable/equatable.dart';

class PostFoodEntity extends Equatable {
  const PostFoodEntity({
    required this.foodId,
    required this.foodName,
    required this.foodMaterial,
    required this.foodRecipe,
    required this.foodCategory,
    required this.foodPhoto,
  });

  final String foodId;
  final String foodName;
  final String foodMaterial;
  final String foodRecipe;
  final String foodCategory;
  final String foodPhoto;

  Map<String, Object?> toDocument() {
    return {
      'foodId': foodId,
      'foodName': foodName,
      'foodMaterial': foodMaterial,
      'foodRecipe': foodRecipe,
      'foodCategory': foodCategory,
      'foodPhoto': foodPhoto,
    };
  }

  static PostFoodEntity fromDocument(Map<String, dynamic> doc) {
    return PostFoodEntity(
      foodId: doc['foodId'] as String,
      foodName: doc['foodName'] as String,
      foodMaterial: doc['foodMaterial'] as String,
      foodRecipe: doc['foodRecipe'] as String,
      foodCategory: doc['foodCategory'] as String,
      foodPhoto: doc['foodPhoto'] as String,
    );
  }

  @override
  List<Object?> get props => [
        foodId,
        foodName,
        foodMaterial,
        foodRecipe,
        foodCategory,
        foodPhoto,
      ];

  @override
  String toString() {
    return '''PostFoodEntity: {
     'foodId': $foodId,
      'foodName': $foodName,
      'foodMaterial': $foodMaterial,
      'foodRecipe': $foodRecipe,
      'foodCategory': $foodCategory,
      'foodPhoto': $foodPhoto,
    }''';
  }
}
