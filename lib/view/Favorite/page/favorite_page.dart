import 'package:flutter/material.dart';
import 'package:afiyetlistesi/model/favorite_model_fake.dart';
import 'package:afiyetlistesi/view/Favorite/state/state_manage_favorite.dart';

part '../widget/favorite_card_widget.dart';
part '../widget/content_button_widget.dart';

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
      body: Column(
        children: [
          _BuildContentButton(
            currentFav: currentFav,
            contentChange: contentChange,
            pageChange: pageChange,
          ),
          _buildContent(context)
        ],
      ),
    );
  }

  Expanded _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: pagePadding2x,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            itemCount: CategoryName.values.length,
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              List<FavoriteModell> filteredModels =
                  getFilteredModels(index + 1);

              return ListView.builder(
                itemCount: filteredModels.length,
                itemBuilder: (context, modelIndex) {
                  return _BuildFavoriteCard(model: filteredModels[modelIndex]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double listPhotoHeightSize = 60;
  final double listPhotoWidthSize = 80;
  final double contentButtonHeight = 50;
  final double contentButtonWidght = 100;
  final double optionDot = 7;
  final double cardLineThickness = 3;
  //radius
  final halfRadius = const Radius.circular(15);
  final buttonOnRadius = BorderRadius.circular(15);
  final buttonOffRadius = BorderRadius.circular(7);
  //padding - margin
  final pagePadding2x = const EdgeInsets.all(16.0);
  final contentButtonPadding = const EdgeInsets.symmetric(horizontal: 16);
  final contentButtonMargin = const EdgeInsets.all(5);

  //duration
  final duration = 1;
}

mixin _pageWord {
  final subtitleText = "Tarif için tıkla";
  final foodNotFound = "Yemek adı yükleniyor...";
}
