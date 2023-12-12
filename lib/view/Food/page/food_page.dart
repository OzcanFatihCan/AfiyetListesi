import 'package:afiyetlistesi/model/favorite_model_fake.dart';
import 'package:afiyetlistesi/view/Food/state/state_manage_food.dart';
import 'package:flutter/material.dart';

part '../widgets/content_food_button_widget.dart';
part '../widgets/food_card_widget.dart';

class FoodPageView extends StatefulWidget {
  const FoodPageView({super.key});

  @override
  State<FoodPageView> createState() => _FoodPageViewState();
}

class _FoodPageViewState extends StateManageFood with _pageSize {
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

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: foodColumn,
                ),
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
  final int foodColumn = 2;
  //radius
  final halfRadius = const Radius.circular(15);
  final buttonOnRadius = BorderRadius.circular(15);
  final buttonOffRadius = BorderRadius.circular(7);
  //padding - margin
  final pagePadding2x = const EdgeInsets.all(16.0);
  final foodPadding = const EdgeInsets.only(top: 10);
  final foodTextPadding = const EdgeInsets.only(top: 3, bottom: 8);
  final contentButtonPadding = const EdgeInsets.symmetric(horizontal: 16);
  final contentButtonMargin = const EdgeInsets.all(5);

  //duration
  final duration = 1;
}

mixin _pageWord {
  final subtitleText = "Tarif için tıkla";
  final foodNotFound = "Yemek adı yükleniyor...";
}
