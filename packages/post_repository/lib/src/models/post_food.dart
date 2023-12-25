import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class PostFood extends Equatable {
  const PostFood({
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

  static const empty = PostFood(
    foodId: '',
    foodName: '',
    foodMaterial: '',
    foodRecipe: '',
    foodCategory: '',
    foodPhoto: '',
  );

  PostFood copyWith({
    String? foodId,
    String? foodName,
    String? foodMaterial,
    String? foodRecipe,
    String? foodCategory,
    String? foodPhoto,
  }) {
    return PostFood(
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodMaterial: foodMaterial ?? this.foodMaterial,
      foodRecipe: foodRecipe ?? this.foodRecipe,
      foodCategory: foodCategory ?? this.foodCategory,
      foodPhoto: foodPhoto ?? this.foodPhoto,
    );
  }

  //var olan kullanıcının boş olduğu durumda getirici
  bool get isEmpty => this == PostFood.empty;
  //var olan kullanıcının boş olmadığı durumda getirici
  bool get isNotEmpty => this != PostFood.empty;

  PostFoodEntity toEntity() {
    return PostFoodEntity(
      foodId: foodId,
      foodName: foodName,
      foodMaterial: foodMaterial,
      foodRecipe: foodRecipe,
      foodCategory: foodCategory,
      foodPhoto: foodPhoto,
    );
  }

  static PostFood fromEntity(PostFoodEntity entity) {
    return PostFood(
      foodId: entity.foodId,
      foodName: entity.foodName,
      foodMaterial: entity.foodMaterial,
      foodRecipe: entity.foodRecipe,
      foodCategory: entity.foodCategory,
      foodPhoto: entity.foodPhoto,
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
    return '''PostFood: {
     'foodId': $foodId,
      'foodName': $foodName,
      'foodMaterial': $foodMaterial,
      'foodRecipe': $foodRecipe,
      'foodCategory': $foodCategory,
      'foodPhoto': $foodPhoto,
    }''';
  }
}
