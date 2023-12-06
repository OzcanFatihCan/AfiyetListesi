import 'package:afiyetlistesi/product/project_control_page.dart';
import 'package:afiyetlistesi/view/Home/page/home_page.dart';

import 'package:flutter/material.dart';

abstract class StateManageHome extends State<HomePageView> {
  final pageController = PageController(viewportFraction: 1.0);

  int currentPage = PageName.popular.index;
  bool isEditing = false;
  bool isLoading = false;

  void changeLoading() {
    setState(
      () {
        isLoading = !isLoading;
      },
    );
  }

  void pageChange(int index) {
    setState(
      () {
        currentPage = index;
      },
    );
  }
}

enum ListItemName { yemekEkle, yemeklerim, favorilerim, ayarlar, cikisYap }

extension ListItemNameExtension on ListItemName {
  String getListTitle() {
    switch (this) {
      case ListItemName.yemekEkle:
        return 'Yemek Ekle';
      case ListItemName.yemeklerim:
        return 'Yemeklerim';
      case ListItemName.favorilerim:
        return 'Favorilerim';
      case ListItemName.ayarlar:
        return 'Ayarlar';
      case ListItemName.cikisYap:
        return 'Çıkış Yap';
      default:
        return '';
    }
  }
}
