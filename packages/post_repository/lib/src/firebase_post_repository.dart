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

      final userFoodCollection =
          foodCollection.doc(food.myUser.id).collection('userFood');

      Reference firebaseStoreRef = FirebaseStorage.instance.ref().child(
          '${food.myUser.id}/FoodPhoto/${food.myUser.id + food.foodName}_lead');
      await firebaseStoreRef.putFile(
        imageFile,
      );
      String url = await firebaseStoreRef.getDownloadURL();

      await userFoodCollection.add({
        ...food.toEntity().toDocument(),
        'foodPhoto': url,
      });

      return food.copyWith(foodPhoto: url);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPost() {
    try {
      Post? food;
      final userFoodCollection =
          foodCollection.doc(food!.myUser.id).collection('userFood');
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
}
