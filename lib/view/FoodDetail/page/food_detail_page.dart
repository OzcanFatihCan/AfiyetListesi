import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';

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
                    child: _BuildCardFoodTitle(model: widget._model)),
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
}

class _BuildFoodPhoto extends StatelessWidget with _pageSize, _pageWord {
  _BuildFoodPhoto({
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
          borderRadius: foodDetailRadius,
          child: _model.imagePath.isNotEmpty
              ? Image.network(
                  _model.imagePath,
                  height: foodPhotoHeightSize,
                  width: foodPhotoWidthSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      width: foodPhotoWidthSize,
                      height: foodPhotoHeightSize,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                )
              : SizedBox(
                  height: foodPhotoHeightSize,
                  width: foodPhotoWidthSize,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
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
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _BuildCardFoodTitle extends StatelessWidget with _pageSize, _pageWord {
  _BuildCardFoodTitle({
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Theme.of(context).cardTheme.shape,
      color: AppTheme().customCardTheme().color,
      child: Center(
        child: Text(
          _model.title.isNotEmpty ? _model.title : foodNotFound,
          style: AppTheme().customTextTheme().headlineSmall,
          softWrap: true,
          maxLines: maxLines,
        ),
      ),
    );
  }
}

Text _buildMaterialTitle(BuildContext context, String materialFoodText) {
  return Text(
    materialFoodText,
    textAlign: TextAlign.start,
    style: Theme.of(context).textTheme.headlineMedium,
  );
}

class _BuildMaterials extends StatelessWidget with _pageSize, _pageWord {
  _BuildMaterials({
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: AppTheme().customCardTheme().shape,
          color: Theme.of(context).cardTheme.color,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: objectPadding2x,
              child: Text(
                _model.materialsFood.isNotEmpty
                    ? _model.materialsFood.join('\n')
                    : foodMaterialNotFound,
                style: AppTheme().customTextTheme().labelMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Text _buildRecipeTitle(BuildContext context, String recipeText) {
  return Text(
    recipeText,
    style: Theme.of(context).textTheme.headlineMedium,
  );
}

class _BuildRecipe extends StatelessWidget with _pageSize, _pageWord {
  _BuildRecipe({
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: AppTheme().customCardTheme().shape,
          color: Theme.of(context).cardTheme.color,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: objectPadding2x,
              child: Text(
                _model.recipe.isNotEmpty
                    ? _model.recipe.join('\n')
                    : foodRecipeNotFound,
                style: AppTheme().customTextTheme().labelMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildFavoriteButton extends StatelessWidget with _pageWord {
  _BuildFavoriteButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ButtonDecorationWidget(
            onPressed: () {},
            buttonTitle: buttonTitle,
          ),
        ),
      ),
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
