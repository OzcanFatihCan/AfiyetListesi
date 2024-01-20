import 'package:afiyetlistesi/blocs/get_popular_bloc/get_popular_bloc.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_food_detail_type.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/service/model/popular/popular_model.dart';
import 'package:afiyetlistesi/service/repository/firebase_project_repository.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/view/FoodNotFound/page/food_not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/product/components/text/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:user_repository/user_repository.dart';

part '../widget/content_popular_button_widget.dart';
part '../widget/popular_card_widget.dart';
part '../viewModel/state_manage_popular.dart';

class PopularPageView extends StatefulWidget {
  const PopularPageView({
    Key? key,
    required PageController pageController,
    required this.myUser,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final MyUser myUser;

  @override
  State<PopularPageView> createState() => _PopularPageViewState();
}

class _PopularPageViewState extends StateManagePopular
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPopularBloc(
        projectRepository: FirebaseProjectRepository(),
      )..add(
          GetPopular(),
        ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: pagePadding2x,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeadTextWidget(context),
              Padding(
                padding: spaceObjectPadding,
                child: const SearchTextField(),
              ),
              _BuildContentButton(
                currentFav: currentFav,
                contentChange: contentChange,
                pageChange: popularChange,
              ),
              _buildMiddleTextWidget(context),
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: pagePaddingx,
        child: BlocBuilder<GetPopularBloc, GetPopularState>(
          builder: (context, popularState) {
            if (popularState is GetPopularSuccess) {
              popularPost = popularState.popular;
              return PageView.builder(
                itemCount: CategoryManager.instance.getCategoryTitles().length,
                controller: popularController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  String category =
                      CategoryManager.instance.getCategoryTitles()[index];
                  List<PopularModel> filteredModels = popularPost
                      .where(
                        (value) => value.foodCategory == category,
                      )
                      .toList();
                  return filteredModels.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredModels.length,
                          itemBuilder: (context, modelIndex) {
                            return _BuildPopularCard(
                              model: filteredModels[modelIndex],
                              itemDetailOnTap: () async {
                                await NavigatorManager.instance.pushToPage(
                                    NavigateRoutes.foodDetail,
                                    arguments: {
                                      'model': filteredModels[modelIndex],
                                      'pageType': FoodDetailManager.instance
                                          .getDetailType(
                                        FoodDetailType.popularFood,
                                      ),
                                      'myUser': widget.myUser,
                                    });
                              },
                            );
                          },
                        )
                      : FoodErrorPage(
                          pagePaddingx: pagePaddingx,
                          errorTitle: populerError,
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
    );
  }

  Padding _buildHeadTextWidget(BuildContext context) {
    return Padding(
      padding: spaceObjectPadding,
      child: FittedBox(
        child: Text(
          softWrap: true,
          foodHeadText,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }

  Padding _buildMiddleTextWidget(BuildContext context) {
    return Padding(
      padding: spaceObjectPaddingMin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            foodIntermediateText,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: () {
              _pageChangePopular(PageName.foods.index);
            },
            child: Text(
              allFood,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double optionDot = 7;

  //radius
  final halfRadius = const Radius.circular(15);

  //padding
  final pagePaddingx = const EdgeInsets.all(8.0);
  final pagePadding2x = const EdgeInsets.all(16.0);
  final buttonPaddingx = const EdgeInsets.symmetric(horizontal: 15);
  final spaceObjectPadding = const EdgeInsets.only(bottom: 20);
  final spaceObjectPaddingMin = const EdgeInsets.only(bottom: 5, top: 5);
  final imagePadding = const EdgeInsets.all(16);

  //elevation
  final double elevationValue = 8;
  final double elevationValueOff = 0;

  //duration
  final duration = 1;
}

mixin _pageWord {
  final foodHeadText = "Hamide'nin Lezzet Listesi";
  final foodIntermediateText = "En Sevilenler";
  final subtitleText = "Tarif için tıkla";
  final allFood = "Tümünü Gör";
  final foodNotFound = "Yemek adı yükleniyor...";
  final populerError = "Bu kategoride popüler bulunamadı";
}
