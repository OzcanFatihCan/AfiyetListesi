import 'package:afiyetlistesi/model/favorite_model.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/UserFood/page/user_food_page.dart';
import 'package:flutter/material.dart';

abstract class StateManageUserFood extends State<UserFoodPage> {
  PageController pageController = PageController();
  late List<FavoriteModel> cardItems;
  bool isLoading = false;
  int currentFav = CategoryName.yemek.index;
  final int duration = 1;

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

  void pageChange(int index) {
    setState(
      () {
        currentFav = index;
      },
    );
  }

  void contentChange(int currentFav) {
    setState(() {
      pageController.animateToPage(
        currentFav,
        duration: Duration(seconds: duration),
        curve: Curves.decelerate,
      );
    });
  }

  List<FavoriteModel> getFilteredModels(int category) {
    return cardItems.where((model) => model.category == category).toList();
  }
}

enum CategoryName { yemek, tatli, tursu, recel, icecek }

extension CategoryNameExtension on CategoryName {
  String getListTitle() {
    switch (this) {
      case CategoryName.yemek:
        return 'Yemek';
      case CategoryName.tatli:
        return 'Tatlı';
      case CategoryName.tursu:
        return 'Turşu';
      case CategoryName.recel:
        return 'Reçel';
      case CategoryName.icecek:
        return 'İçecek';
      default:
        return '';
    }
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
          imagePath: ProjectWords.photoUrl10,
          title: "Vişne Reçeli",
          category: 4),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl11,
          title: "İncir Reçeli",
          category: 4),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl10,
          title: "Vişne Reçeli",
          category: 4),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl11,
          title: "İncir Reçeli",
          category: 4),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl10,
          title: "Vişne Reçeli",
          category: 4),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl11,
          title: "İncir Reçeli",
          category: 4),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl6, title: "Baklava", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl7,
          title: "Biber Turşusu",
          category: 3),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl8,
          title: "Salatalık Turşusu",
          category: 3),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl9,
          title: "Lahana Turşusu",
          category: 3),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl7,
          title: "Biber Turşusu",
          category: 3),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl8,
          title: "Salatalık Turşusu",
          category: 3),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl9,
          title: "Lahana Turşusu",
          category: 3),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl4,
          title: "Erik Kompostosu",
          category: 5),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl5,
          title: "Elma Kompostosu",
          category: 5),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl4,
          title: "Erik Kompostosu",
          category: 5),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl5,
          title: "Elma Kompostosu",
          category: 5),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl4,
          title: "Erik Kompostosu",
          category: 5),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl5,
          title: "Elma Kompostosu",
          category: 5),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl6, title: "Baklava", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
    ];
  }
}
