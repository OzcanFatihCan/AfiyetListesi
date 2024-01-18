import 'package:afiyetlistesi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:afiyetlistesi/blocs/delete_favorite_bloc/delete_favorite_bloc.dart';
import 'package:afiyetlistesi/blocs/get_favorite_bloc/get_favorite_bloc.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_food_detail_type.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/service/model/favorite/favorite_model.dart';
import 'package:afiyetlistesi/service/repository/firebase_project_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:user_repository/user_repository.dart';

part '../widget/favorite_card_widget.dart';
part '../widget/content_button_widget.dart';
part '../viewModel/state_manage_favorite.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({required this.myUser, super.key});
  final MyUser myUser;

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends StateManageFavorite with _pageSize {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetFavoriteBloc(
            projectRepository: FirebaseProjectRepository(),
          )..add(
              GetFavorite(userId: userId),
            ),
        ),
        BlocProvider(
          create: (context) => DeleteFavoriteBloc(
            projectRepository: FirebaseProjectRepository(),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            _BuildContentButton(
              contentChange: contentChange,
              pageChange: pageChange,
              currentPageNotifier: currentPageNotifier,
            ),
            _buildContent(context)
          ],
        ),
      ),
    );
  }

  Expanded _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: pagePadding2x,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<GetFavoriteBloc, GetFavoriteState>(
            builder: (context, state) {
              if (state is GetFavoriteSuccess) {
                favoritePosts = state.favorite;
                return PageView.builder(
                  itemCount:
                      CategoryManager.instance.getCategoryTitles().length,
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    String category =
                        CategoryManager.instance.getCategoryTitles()[index];
                    List<FavoriteModel> filteredModels = favoritePosts
                        .where(
                          (value) => value.favorite.foodCategory == category,
                        )
                        .toList();
                    return ListView.builder(
                      itemCount: filteredModels.length,
                      itemBuilder: (context, modelIndex) {
                        return _BuildFavoriteCard(
                          model: filteredModels[modelIndex],
                          itemDeleteOnPressed: () {
                            favoriteDeleteFunc(
                              filteredModels,
                              modelIndex,
                              context,
                            );
                          },
                          itemDetailOnTap: () async {
                            favoriteDetailFunc(
                              filteredModels,
                              modelIndex,
                            );
                          },
                        );
                      },
                    );
                  },
                );
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    ItemsofAsset.lottieLoading.fetchLottie,
                  ),
                );
              }
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
  final foodNotFound = "Yemek adı bulunamadı";
  final deleteFood = "Bu favoriyi silmek istediğinizden emin misiniz?";
  final deleteFoodTitle = "Favoriyi Sil";
  final cancelButton = "İptal";
  final okButton = "Sil";
}
