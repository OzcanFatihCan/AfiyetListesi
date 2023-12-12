import 'package:afiyetlistesi/model/favorite_model_fake.dart';
import 'package:afiyetlistesi/view/UserFood/viewModel/state_manage_user_food.dart';
import 'package:flutter/material.dart';

part '../widget/content_ufood_button_widget.dart';
part '../widget/user_food_card_widget.dart';

class UserFoodPageView extends StatefulWidget {
  const UserFoodPageView({super.key});

  @override
  State<UserFoodPageView> createState() => _UserFoodPageViewState();
}

class _UserFoodPageViewState extends StateManageUserFood with _pageSize {
  final appText = "Yemeklerim";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          appText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [
          _BuildContentButton(
            currentFav: currentFav,
            contentChange: contentChange,
            pageChange: pageChange,
          ),
          _buildContent(context),
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
