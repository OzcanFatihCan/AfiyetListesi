import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/service/model/popular/popular_model.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/product/components/text/search_text_field.dart';

part '../widget/content_popular_button_widget.dart';
part '../widget/popular_card_widget.dart';
part '../viewModel/state_manage_popular.dart';

class PopularPageView extends StatefulWidget {
  const PopularPageView({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  State<PopularPageView> createState() => _PopularPageViewState();
}

class _PopularPageViewState extends StateManagePopular
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Padding(
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
          padding: pagePadding2x,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(),
            /*
              PageView.builder(
                  itemCount:
                      CategoryManager.instance.getCategoryTitles().length,
                  controller: popularController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    
                    return ListView.builder(
                       scrollDirection: Axis.horizontal,
                      itemCount: filteredModels.length,
                      itemBuilder: (context, modelIndex) {
                        return _BuildPopularCard(
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
            */
          )),
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
  final double spaceObjects = 20;
  final double spaceObjectsMin = 10;
  final double foodPhotoHeightSize = 130;
  final double foodPhotoWidthSize = 120;
  final double optionDot = 7;

  //radius
  final halfRadius = const Radius.circular(15);

  //padding
  final pagePaddingx = const EdgeInsets.all(8.0);
  final pagePadding2x = const EdgeInsets.all(16.0);
  final buttonPaddingx = const EdgeInsets.symmetric(horizontal: 15);
  final listPaddingx = const EdgeInsets.symmetric(horizontal: 10);
  final spaceObjectPadding = const EdgeInsets.only(bottom: 20);
  final spaceObjectPaddingMin = const EdgeInsets.only(bottom: 5, top: 5);

  final imagePadding =
      const EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 32);

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
}
