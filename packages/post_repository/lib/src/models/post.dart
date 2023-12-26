import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

import '../entities/entities.dart';

// ignore: must_be_immutable
class Post extends Equatable {
  Post({
    required this.foodId,
    required this.foodName,
    required this.foodMaterial,
    required this.foodRecipe,
    required this.foodCategory,
    required this.foodPhoto,
    required this.myUser,
  });

  String foodId;
  String foodName;
  String foodMaterial;
  String foodRecipe;
  String foodCategory;
  String foodPhoto;
  MyUser myUser;

  static final empty = Post(
    foodId: '',
    foodName: '',
    foodMaterial: '',
    foodRecipe: '',
    foodCategory: '',
    foodPhoto: '',
    myUser: MyUser.empty,
  );

  Post copyWith({
    String? foodId,
    String? foodName,
    String? foodMaterial,
    String? foodRecipe,
    String? foodCategory,
    String? foodPhoto,
    MyUser? myUser,
  }) {
    return Post(
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodMaterial: foodMaterial ?? this.foodMaterial,
      foodRecipe: foodRecipe ?? this.foodRecipe,
      foodCategory: foodCategory ?? this.foodCategory,
      foodPhoto: foodPhoto ?? this.foodPhoto,
      myUser: myUser ?? this.myUser,
    );
  }

  //var olan post boş olduğu durumda getirici
  bool get isEmpty => this == Post.empty;
  //var olan post boş olmadığı durumda getirici
  bool get isNotEmpty => this != Post.empty;

  PostEntity toEntity() {
    return PostEntity(
        foodId: foodId,
        foodName: foodName,
        foodMaterial: foodMaterial,
        foodRecipe: foodRecipe,
        foodCategory: foodCategory,
        foodPhoto: foodPhoto,
        myUser: myUser);
  }

  static Post fromEntity(PostEntity entity) {
    return Post(
      foodId: entity.foodId,
      foodName: entity.foodName,
      foodMaterial: entity.foodMaterial,
      foodRecipe: entity.foodRecipe,
      foodCategory: entity.foodCategory,
      foodPhoto: entity.foodPhoto,
      myUser: entity.myUser,
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
        myUser,
      ];

  @override
  String toString() {
    return '''Post: {
     'foodId': $foodId,
      'foodName': $foodName,
      'foodMaterial': $foodMaterial,
      'foodRecipe': $foodRecipe,
      'foodCategory': $foodCategory,
      'foodPhoto': $foodPhoto,
       'myUser': $myUser
    }''';
  }
}
