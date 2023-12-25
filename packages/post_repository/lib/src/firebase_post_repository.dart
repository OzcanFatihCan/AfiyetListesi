import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

class FirebasePostRepository implements FoodRepository {
  FirebasePostRepository({
    required MyUser myUser,
  }) : _myUser = myUser;

  final MyUser _myUser;

  final foodCollection = FirebaseFirestore.instance.collection('foods');

  @override
  Future<PostFood> createFood(PostFood food) async {
    try {
      final userFoodCollection =
          foodCollection.doc(_myUser.id).collection('userFood');
      await userFoodCollection.doc().set(food.toEntity().toDocument());
      return food;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<PostFood>> getFood() {
    try {
      final userFoodCollection =
          foodCollection.doc(_myUser.id).collection('userFood');
      return userFoodCollection.get().then((value) => value.docs
          .map(
            (e) => PostFood.fromEntity(
              PostFoodEntity.fromDocument(
                e.data(),
              ),
            ),
          )
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
