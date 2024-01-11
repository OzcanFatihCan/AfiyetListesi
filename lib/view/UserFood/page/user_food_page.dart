import 'package:afiyetlistesi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:afiyetlistesi/blocs/delete_post_bloc/delete_post_bloc.dart';
import 'package:afiyetlistesi/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_food_detail_type.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:post_repository/post_repository.dart';

part '../widget/content_ufood_button_widget.dart';
part '../widget/user_food_card_widget.dart';
part '../viewModel/state_manage_user_food.dart';

class UserFoodPageView extends StatefulWidget {
  const UserFoodPageView({super.key});

  @override
  State<UserFoodPageView> createState() => _UserFoodPageViewState();
}

class _UserFoodPageViewState extends StateManageUserFood with _pageSize {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetPostBloc(
            postRepository: FirebasePostRepository(),
          )..add(
              GetPosts(userId: userId),
            ),
        ),
        BlocProvider(
          create: (context) => DeletePostBloc(
            myPostRepository: FirebasePostRepository(),
          ),
        ),
      ],
      child: Scaffold(
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
                    return ListView.builder(
                      itemCount: filteredModels.length,
                      itemBuilder: (context, modelIndex) {
                        return _BuildUserFoodCard(
                          model: filteredModels[modelIndex],
                          itemDeleteOnPressed: () {
                            context.read<DeletePostBloc>().add(
                                  DeletePost(
                                    userId: userId,
                                    postId: filteredModels[modelIndex].foodId,
                                  ),
                                );
                            context.read<GetPostBloc>().add(
                                  GetPosts(userId: userId),
                                );
                            Navigator.pop(context);
                          },
                          itemDetailOnTap: () async {
                            await NavigatorManager.instance.pushToPageRotate(
                                NavigateRoutes.foodDetail,
                                arguments: {
                                  'model': filteredModels[modelIndex],
                                  'pageType':
                                      FoodDetailManager.instance.getDetailType(
                                    FoodDetailType.userfood,
                                  ),
                                }).then((value) {
                              if (value) {
                                context.read<GetPostBloc>().add(
                                      GetPosts(userId: userId),
                                    );
                              }
                            });
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
  final deleteFood = "Bu yemeği silmek istediğinizden emin misiniz?";
  final deleteFoodTitle = "Yemeği Sil";
  final cancelButton = "İptal";
  final okButton = "Sil";
}
