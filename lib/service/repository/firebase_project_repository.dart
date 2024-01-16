import 'dart:developer';

import 'package:afiyetlistesi/service/model/favorite/favorite_entity.dart';
import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';
import 'package:afiyetlistesi/service/model/popular/popular_model.dart';
import 'package:afiyetlistesi/service/repository/project_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProjectRepository implements ProjectRepository {
  final favoriteCollection = FirebaseFirestore.instance.collection('favorites');
  final popularCollection = FirebaseFirestore.instance.collection('popular');

  @override
  Future<void> createFavorite(FavoriteModel userFavorite) async {
    try {
      DocumentReference documentFavoriteRef = await favoriteCollection
          .doc(userFavorite.favorite.myUser.id)
          .collection('userFavorite')
          .add({
        ...userFavorite.toEntity().toDocument(),
      });

      Reference sourceFoto =
          FirebaseStorage.instance.refFromURL(userFavorite.favorite.foodPhoto);

      final fotoUrl = await sourceFoto.getData();

      Reference storageFavoriteRef = FirebaseStorage.instance.ref().child(
          '${userFavorite.favorite.myUser.id}/FavoritePhoto/${userFavorite.favorite.foodId}foodFavoritePhoto_lead');
      await storageFavoriteRef.putData(fotoUrl!);
      String favoritePhotoUrl = await storageFavoriteRef.getDownloadURL();

      await documentFavoriteRef.update({
        'favorite.foodPhoto': favoritePhotoUrl,
      });

      await createPopular(userFavorite);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> createPopular(FavoriteModel userPopular) async {
    try {
      DocumentSnapshot documentPopularRef =
          await popularCollection.doc(userPopular.favorite.foodId).get();

      if (documentPopularRef.exists) {
        await popularCollection.doc(userPopular.favorite.foodId).update({
          'count': FieldValue.increment(1),
        });
      } else {
        PopularModel popularModel = PopularModel(
          foodId: userPopular.favorite.foodId,
          foodName: userPopular.favorite.foodName,
          foodMaterial: userPopular.favorite.foodMaterial,
          foodRecipe: userPopular.favorite.foodRecipe,
          foodCategory: userPopular.favorite.foodCategory,
          foodPhoto: userPopular.favorite.foodPhoto,
          count: 1,
        );

        Reference sourceFoto =
            FirebaseStorage.instance.refFromURL(popularModel.foodPhoto);

        final fotoUrl = await sourceFoto.getData();

        Reference storagePopularRef = FirebaseStorage.instance
            .ref()
            .child('popular/${popularModel.foodId}foodPopularPhoto_lead');
        await storagePopularRef.putData(fotoUrl!);
        String popularPhotoUrl = await storagePopularRef.getDownloadURL();

        await popularCollection.doc(userPopular.favorite.foodId).set({
          ...popularModel.toEntity().toDocument(),
          'foodPhoto': popularPhotoUrl,
        });
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<FavoriteModel>> getFavorite(String userId) {
    try {
      final documentFavoriRef =
          favoriteCollection.doc(userId).collection("userFavorite");
      return documentFavoriRef.get().then(
            (value) => value.docs
                .map(
                  (e) => FavoriteModel.fromEntity(
                    FavoriteEntity.fromDocument(
                      e.data(),
                    ),
                  ),
                )
                .toList(),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteFavorite(String userId, String favoriteId) async {
    try {
      final documentFavoriteRef =
          favoriteCollection.doc(userId).collection('userFavorite');
      final Reference storageFavoriteRef = FirebaseStorage.instance
          .ref()
          .child("$userId/FavoritePhoto/${favoriteId}foodFavoritePhoto_lead");
      DocumentSnapshot favoriteSnapshot =
          await documentFavoriteRef.doc(favoriteId).get();
      String foodId = favoriteSnapshot.get('favorite.foodId');

      await documentFavoriteRef.doc(favoriteId).delete();
      await storageFavoriteRef.delete();

      await deletePopular(foodId);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> deletePopular(String foodId) async {
    try {
      DocumentSnapshot popularSnapshot =
          await popularCollection.doc(foodId).get();
      if (popularSnapshot.exists) {
        int count = popularSnapshot.get('count');
        if (count > 1) {
          await popularCollection.doc(foodId).update({
            'count': FieldValue.increment(-1),
          });
        } else {
          Reference storagePopularRef = FirebaseStorage.instance
              .ref()
              .child('popular/${foodId}foodPopularPhoto_lead');
          await popularCollection.doc(foodId).delete();
          await storagePopularRef.delete();
        }
      } else {
        log('Popular not found');
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
