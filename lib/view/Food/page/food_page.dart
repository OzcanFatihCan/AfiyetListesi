import 'package:afiyetlistesi/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_food_detail_type.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

part '../widgets/content_food_button_widget.dart';
part '../widgets/food_card_widget.dart';
part '../viewModel/state_manage_food.dart';

class FoodPageView extends StatefulWidget {
  const FoodPageView({
    required MyUser myUser,
    super.key,
    required PageController pageController,
  })  : _pageController = pageController,
        _myUser = myUser;
  final MyUser _myUser;

  final PageController _pageController;

  @override
  State<FoodPageView> createState() => _FoodPageViewState();
}

class _FoodPageViewState extends StateManageFood with _pageSize {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPostBloc(
        postRepository: FirebasePostRepository(),
      )..add(
          GetPosts(userId: mainId),
        ),
      child: Scaffold(
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
      ),
    );
  }

  Expanded _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: pagePadding2x,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<GetPostBloc, GetPostState>(
            builder: (context, state) {
              if (state is GetPostSuccess) {
                foodPosts = state.posts;
                return PageView.builder(
                  itemCount:
                      CategoryManager.instance.getCategoryTitles().length,
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    String category =
                        CategoryManager.instance.getCategoryTitles()[index];
                    List<Post> filteredModels = foodPosts
                        .where((post) => post.foodCategory == category)
                        .toList();
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: foodColumn,
                      ),
                      itemCount: filteredModels.length,
                      itemBuilder: (context, modelIndex) {
                        return _BuildFoodCard(
                          model: filteredModels[modelIndex],
                          onTap: () async {
                            foodDetailFunc(
                              filteredModels,
                              modelIndex,
                            );
                          },
                        );
                      },
                    );
                  },
                );
              } else if (state is GetPostLoading) {
                return Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    ItemsofAsset.lottieLoading.fetchLottie,
                  ),
                );
              } else if (state is GetPostFailure) {
                return Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    ItemsofAsset.lottieLoading.fetchLottie,
                  ),
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
