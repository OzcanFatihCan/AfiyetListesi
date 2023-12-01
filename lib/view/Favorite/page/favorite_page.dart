import 'package:flutter/material.dart';
import 'package:afiyetlistesi/model/favorite_model.dart';
import 'package:afiyetlistesi/view/Favorite/state/state_manage_favorite.dart';

part '../widget/favorite_card_widget.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends StateManageFavorite with _pageSize {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: pagePadding2x,
        child: ListView.builder(
          itemCount: cardItems.length,
          itemBuilder: (context, index) {
            return _BuildFavoriteCard(model: cardItems[index]);
          },
        ),
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double listPhotoHeightSize = 60;
  final double listPhotoWidthSize = 80;
  //radius
  final halfRadius = const Radius.circular(15);
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
}

mixin _pageWord {
  final subtitleText = "Tarif için tıkla";
  final foodNotFound = "Yemek adı yükleniyor...";
}
