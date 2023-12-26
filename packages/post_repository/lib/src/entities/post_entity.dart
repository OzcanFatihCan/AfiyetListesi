import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

// ignore: must_be_immutable
class PostEntity extends Equatable {
  PostEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'foodId': foodId,
      'foodName': foodName,
      'foodMaterial': foodMaterial,
      'foodRecipe': foodRecipe,
      'foodCategory': foodCategory,
      'foodPhoto': foodPhoto,
      'myUser': myUser.toEntity().toDocument(),
    };
  }

  static PostEntity fromDocument(Map<String, dynamic> doc) {
    return PostEntity(
      foodId: doc['foodId'] as String,
      foodName: doc['foodName'] as String,
      foodMaterial: doc['foodMaterial'] as String,
      foodRecipe: doc['foodRecipe'] as String,
      foodCategory: doc['foodCategory'] as String,
      foodPhoto: doc['foodPhoto'] as String,
      myUser: MyUser.fromEntity(
        MyUserEntity.fromDocument(doc['myUser']),
      ),
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
    return '''PostEntity: {
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
