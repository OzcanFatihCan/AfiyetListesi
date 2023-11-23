import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';
import 'package:afiyetlistesi/product/error_text.dart';
import 'package:afiyetlistesi/product/project_words.dart';

import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({
    super.key,
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;
  final _cardHeight = 70.0;
  final _cardWidth = 230.0;
  final _cardBottom = 0.0;
  final _backLeft = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned.fill(
                  bottom: _cardHeight / 2,
                  child: _BuildFoodPhoto(model: _model),
                ),
                Positioned(
                    height: _cardHeight,
                    width: _cardWidth,
                    bottom: _cardBottom,
                    child: _cardCustom(context)),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: _backLeft,
                  child: const _BackButtonWidget(),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: PageItemSize.pagePadding2x,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ProjectWords.materialFoodText,
                      textAlign: TextAlign.start,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: PageColors.blackColor,
                                fontWeight: PageFont.headFont,
                              ),
                    ),
                    const SizedBox(
                      height: PageItemSize.spaceObjectsMin,
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          _model.materialsFood.isNotEmpty
                              ? _model.materialsFood.join('\n')
                              : ProjectErrorText.foodNotFound,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: PageColors.blackColor,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: PageItemSize.spaceObjectsMin,
                    ),
                    Text(
                      ProjectWords.recipeText,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: PageColors.blackColor,
                                fontWeight: PageFont.headFont,
                              ),
                    ),
                    const SizedBox(
                      height: PageItemSize.spaceObjects,
                    ),
                    Expanded(
                      flex: 4,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          _model.recipe.isNotEmpty
                              ? _model.recipe.join('\n')
                              : ProjectErrorText.foodNotFound,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: PageColors.blackColor,
                                  ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Card _cardCustom(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          PageItemSize.halfRadius(),
        ),
      ),
      color: PageColors.cardColor2,
      child: Center(
        child: Text(
          _model.title.isNotEmpty
              ? _model.title
              : ProjectErrorText.foodNotFound,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: PageColors.textFieldContentOnColor,
                fontWeight: PageFont.textFont,
              ),
          softWrap: true,
          maxLines: 2,
        ),
      ),
    );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: PageColors.backButtonColor,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: PageColors.activeButtonColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _BuildFoodPhoto extends StatelessWidget {
  const _BuildFoodPhoto({
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'food-image-${_model.imagePath}',
      createRectTween: (Rect? begin, Rect? end) {
        return MaterialRectCenterArcTween(begin: end, end: begin);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.40,
        child: ClipRRect(
          borderRadius: PageItemSize.foodDetailRadius(),
          child: _model.imagePath.isNotEmpty
              ? Image.network(
                  _model.imagePath,
                  height: PageItemSize.foodPhotoHeightSize,
                  width: PageItemSize.foodPhotoWidthSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      width: PageItemSize.foodPhotoWidthSize,
                      height: PageItemSize.foodPhotoHeightSize,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                )
              : const SizedBox(
                  height: PageItemSize.foodPhotoHeightSize,
                  width: PageItemSize.foodPhotoWidthSize,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
      ),
    );
  }
}
