import 'package:afiyetlistesi/model/favorite_model.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/Favorite/page/favorite_page.dart';
import 'package:flutter/material.dart';

abstract class StateManageFavorite extends State<FavoritePageView> {
  late List<FavoriteModel> cardItems;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    cardItems = FavoriteItems().cardItems;
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

class FavoriteItems {
  late List<FavoriteModel> cardItems;
  FavoriteItems() {
    cardItems = [
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
    ];
  }
}
