import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:post_repository/post_repository.dart';

class FirebasePostRepository implements PostRepository {
  final foodCollection = FirebaseFirestore.instance.collection('foods');

  @override
  Future<Post> createPost(Post food) async {
    try {
      File imageFile = File(food.foodPhoto);

      DocumentReference docRef =
          await foodCollection.doc(food.myUser.id).collection('userFood').add({
        ...food.toEntity().toDocument(),
      });

      food.foodId = docRef.id;

      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('${food.myUser.id}/FoodPhoto/${food.foodId}foodPhoto_lead');
      await firebaseStorageRef.putFile(imageFile);
      String url = await firebaseStorageRef.getDownloadURL();

      await docRef.update({
        'foodPhoto': url,
        'foodId': food.foodId,
      });

      return food.copyWith(foodPhoto: url);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPost(String userId) {
    try {
      final userFoodCollection =
          foodCollection.doc(userId).collection('userFood');
      return userFoodCollection.get().then((value) => value.docs
          .map(
            (e) => Post.fromEntity(
              PostEntity.fromDocument(
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

  @override
  Future<void> deletePost(String userId, String postId) async {
    try {
      final userFoodCollection =
          foodCollection.doc(userId).collection('userFood');
      final Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('$userId/FoodPhoto/${postId}foodPhoto_lead');
      //collection delete
      await userFoodCollection.doc(postId).delete();
      //collection photo delete
      await firebaseStorageRef.delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
