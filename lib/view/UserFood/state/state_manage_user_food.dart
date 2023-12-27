import 'package:afiyetlistesi/model/favorite_model_fake.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/view/UserFood/page/user_food_page.dart';
import 'package:flutter/material.dart';

abstract class StateManageUserFood extends State<UserFoodPageView> {
  PageController pageController = PageController();
  late List<FavoriteModell> cardItems;
  bool isLoading = false;
  int currentFav =
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
  final int duration = 1;

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
}
