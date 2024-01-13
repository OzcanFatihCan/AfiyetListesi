import 'dart:developer';
import 'dart:typed_data';

import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';
import 'package:afiyetlistesi/service/model/popular/popular_model.dart';
import 'package:afiyetlistesi/service/repository/project_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProjectRepository implements ProjectRepository {
  final favoriteCollection = FirebaseFirestore.instance.collection('favorites');
  final popularCollection = FirebaseFirestore.instance.collection('popular');

  @override
  Future<void> createFavorite(FavoriteModel userFavorite) async {
    try {
      final Uint8List imageData;
      DocumentReference documentFavoriteRef = await favoriteCollection
          .doc(userFavorite.favorite.myUser.id)
          .collection('userFavorite')
          .add({
        ...userFavorite.toEntity().toDocument(),
      });

      userFavorite.favorite.foodId = documentFavoriteRef.id;
      imageData = await getBytesFromUrl(userFavorite.favorite.foodPhoto);

      Reference storageFavoriteRef = FirebaseStorage.instance.ref().child(
          '${userFavorite.favorite.myUser.id}/FavoritePhoto/${userFavorite.favorite.foodId}foodFavoritePhoto_lead');
      await storageFavoriteRef.putData(imageData);
      String favoritePhotoUrl = await storageFavoriteRef.getDownloadURL();

      await documentFavoriteRef.update({
        'foodPhoto': favoritePhotoUrl,
        'foodId': userFavorite.favorite.foodId,
      });

      await createPopular(userFavorite);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createPopular(FavoriteModel userPopular) async {
    try {
      final Uint8List imagePopularData;
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

        imagePopularData = await getBytesFromUrl(popularModel.foodPhoto);

        Reference storagePopularRef = FirebaseStorage.instance
            .ref()
            .child('popular/${popularModel.foodId}foodPopularPhoto_lead');
        await storagePopularRef.putData(imagePopularData);
        String popularPhotoUrl = await storagePopularRef.getDownloadURL();

        await popularCollection.doc(userPopular.favorite.foodId).set({
          'foodPhoto': popularPhotoUrl,
          ...popularModel.toEntity().toDocument(),
        });
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

Future<Uint8List> getBytesFromUrl(String url) async {
  try {
    final response = await Dio().get<List<int>>(url);

    if (response.statusCode == 200 && response.data != null) {
      return Uint8List.fromList(response.data!);
    } else {
      throw Exception(
          'URL\'den veri alınamadı: $url, Hata Kodu: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('URL\'den veri alınırken hata oluştu: $e');
  }
}
