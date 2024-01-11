import 'package:afiyetlistesi/service/model/popular/popular_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PopularModel extends Equatable {
  PopularModel({
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

  static final empty = PopularModel(
    foodId: '',
    foodName: '',
    foodMaterial: '',
    foodRecipe: '',
    foodCategory: '',
    foodPhoto: '',
    count: 0,
  );

  PopularModel copyWith({
    String? foodId,
    String? foodName,
    String? foodMaterial,
    String? foodRecipe,
    String? foodCategory,
    String? foodPhoto,
    int? count,
  }) {
    return PopularModel(
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodMaterial: foodMaterial ?? this.foodMaterial,
      foodRecipe: foodRecipe ?? this.foodRecipe,
      foodCategory: foodCategory ?? this.foodCategory,
      foodPhoto: foodPhoto ?? this.foodPhoto,
      count: count ?? this.count,
    );
  }

  bool get isEmpty => this == PopularModel.empty;
  bool get isNotEmpty => this != PopularModel.empty;

  PopularEntity toEntity() {
    return PopularEntity(
      foodId: foodId,
      foodName: foodName,
      foodMaterial: foodMaterial,
      foodRecipe: foodRecipe,
      foodCategory: foodCategory,
      foodPhoto: foodPhoto,
      count: count,
    );
  }

  static PopularModel fromEntity(PopularEntity entity) {
    return PopularModel(
      foodId: entity.foodId,
      foodName: entity.foodName,
      foodMaterial: entity.foodMaterial,
      foodRecipe: entity.foodRecipe,
      foodCategory: entity.foodCategory,
      foodPhoto: entity.foodPhoto,
      count: entity.count,
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
    return '''PopularModel: {
     'foodId': $foodId,
      'foodName': $foodName,
      'foodMaterial': $foodMaterial,
      'foodRecipe': $foodRecipe,
      'foodCategory': $foodCategory,
      'foodPhoto': $foodPhoto,
       'count': $count
    }''';
  }
}
