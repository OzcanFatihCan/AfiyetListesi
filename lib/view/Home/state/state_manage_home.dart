import 'package:afiyetlistesi/manager/appbar_manager.dart';
import 'package:afiyetlistesi/view/Home/page/home_page.dart';

import 'package:flutter/material.dart';

abstract class StateManageHome extends State<HomePageView> {
  final pageController = PageController(viewportFraction: 1.0);
  late AppBarManager appBarManager;
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

//profil func
  void changeEditing() {
    setState(
      () {
        isEditing = !isEditing;
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

  //sayfa işlevleri yaparken IconButtonları ilgili sayfanın page stateinden çek.
  List<Widget> buildActionsForPage(PageName currentPage) {
    switch (currentPage) {
      case PageName.favorite:
        return [
          IconButton(
            icon: const Icon(Icons.filter_alt_rounded),
            onPressed: () {},
          ),
        ];
      case PageName.profile:
        return [
          IconButton(
            icon: isEditing
                ? const Icon(Icons.check_rounded)
                : const Icon(Icons.edit_rounded),
            onPressed: () {
              changeEditing();
            },
          ),
        ];
      default:
        return [];
    }
  }
}

enum PageName { popular, favorite, profile, foods }

extension PageNameExtension on PageName {
  String getPageTitle() {
    switch (this) {
      case PageName.popular:
        return 'Anasayfa';
      case PageName.favorite:
        return 'Favoriler';
      case PageName.profile:
        return 'Profil';
      case PageName.foods:
        return 'Yemekler';
      default:
        return '';
    }
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
