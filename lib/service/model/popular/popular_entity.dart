import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PopularEntity extends Equatable {
  PopularEntity({
    required this.foodId,
    required this.foodName,
    required this.foodMaterial,
    required this.foodRecipe,
    required this.foodCategory,
    required this.foodPhoto,
    required this.count,
  });
  String foodId;
  String foodName;
  String foodMaterial;
  String foodRecipe;
  String foodCategory;
  String foodPhoto;
  int count;

  Map<String, Object?> toDocument() {
    return {
      'foodId': foodId,
      'foodName': foodName,
      'foodMaterial': foodMaterial,
      'foodRecipe': foodRecipe,
      'foodCategory': foodCategory,
      'foodPhoto': foodPhoto,
      'count': count,
    };
  }

  static PopularEntity fromDocument(Map<String, dynamic> doc) {
    return PopularEntity(
      foodId: doc['foodId'] as String,
      foodName: doc['foodName'] as String,
      foodMaterial: doc['foodMaterial'] as String,
      foodRecipe: doc['foodRecipe'] as String,
      foodCategory: doc['foodCategory'] as String,
      foodPhoto: doc['foodPhoto'] as String,
      count: doc['count'] as int,
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
        count,
      ];

  @override
  String toString() {
    return '''PopularEntity: {
     'foodId': $foodId,
      'foodName': $foodName,
      'foodMaterial': $foodMaterial,
      'foodRecipe': $foodRecipe,
      'foodCategory': $foodCategory,
      'foodPhoto': $foodPhoto,
      'count': $count,
    }''';
  }
}
