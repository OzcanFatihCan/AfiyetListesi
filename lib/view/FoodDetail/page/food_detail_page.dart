import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';

part '../widget/food_photo_widget.dart';
part '../widget/back_button_widget.dart';
part '../widget/favorite_button_widget.dart';
part '../widget/materials_content_widget.dart';
part '../widget/recipe_content_widget.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({
    super.key,
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned.fill(
                  bottom: cardHeight / 2,
                  child: _BuildFoodPhoto(model: widget._model),
                ),
                Positioned(
                    height: cardHeight,
                    width: cardWidth,
                    bottom: cardBottom,
                    child: _buildFoodTitle(context)),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  left: backLeft,
                  bottom: backBottom,
                  child: const _BackButtonWidget(),
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: pagePadding2x,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildMaterialTitle(context, materialFoodText),
                    SizedBox(height: spaceObjectsMin),
                    _BuildMaterials(model: widget._model),
                    SizedBox(height: spaceObjectsMin),
                    _buildRecipeTitle(context, recipeText),
                    SizedBox(height: spaceObjectsMin),
                    _BuildRecipe(model: widget._model),
                    SizedBox(height: spaceObjectsMin),
                    _BuildFavoriteButton()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Card _buildFoodTitle(BuildContext context) {
    return Card(
      shape: Theme.of(context).cardTheme.shape,
      color: AppTheme().customCardTheme().color,
      child: Center(
        child: Text(
          widget._model.title.isNotEmpty ? widget._model.title : foodNotFound,
          style: AppTheme().customTextTheme().headlineSmall,
          softWrap: true,
          maxLines: maxLines,
        ),
      ),
    );
  }

  Text _buildMaterialTitle(BuildContext context, String materialFoodText) {
    return Text(
      materialFoodText,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Text _buildRecipeTitle(BuildContext context, String recipeText) {
    return Text(
      recipeText,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

mixin _pageSize {
  //obj
  final cardHeight = 70.0;
  final cardWidth = 230.0;
  final cardBottom = 0.0;
  final backLeft = 20.0;
  final backBottom = 200.0;
  final maxLines = 2;
  final double foodPhotoHeightSize = 130;
  final double foodPhotoWidthSize = 120;
  final double spaceObjectsMin = 10;
  //radius
  final halfRadius = const Radius.circular(15);
  final foodDetailRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
  final objectPadding2x = const EdgeInsets.all(16.0);
}

mixin _pageWord {
  final subtitleText = "Tarif için tıkla";
  final foodNotFound = "Yemek adı yükleniyor...";
  final foodRecipeNotFound = "Yemek tarifi yükleniyor...";
  final buttonTitle = "Favoriye Ekle";
  final materialFoodText = "Malzemeler";
  final recipeText = "Yapılışı";
  final foodMaterialNotFound = "Yemek malzeme yükleniyor...";
}

mixin _pageDuration {
  final int duration = 1;
}
