part of '../../page/food_detail_page.dart';

class _PopularDetailWidget extends StatelessWidget with _pageSize, _pageWord {
  _PopularDetailWidget({
    required PopularFavoriteModel model,
  }) : _model = model;
  final PopularFavoriteModel _model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned.fill(
                bottom: cardHeight / 2,
                child: _BuildPopularFoodPhoto(model: _model),
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
                  _buildCategory(),
                  _buildMaterialTitle(context, materialFoodText),
                  _BuildMaterials(model: _model),
                  _buildRecipeTitle(context, recipeText),
                  _BuildRecipe(model: _model),
                  _BuildFavoriteButton()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCategory() {
    return Padding(
      padding: spaceObjectPaddingPopular,
      child: Text(
        "Kategori:${_model.category}",
        style: AppTheme().customTextTheme().labelMedium,
      ),
    );
  }

  Card _buildFoodTitle(BuildContext context) {
    return Card(
      shape: Theme.of(context).cardTheme.shape,
      color: Theme.of(context).colorScheme.onPrimary,
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

  Padding _buildMaterialTitle(BuildContext context, String materialFoodText) {
    return Padding(
      padding: spaceObjectPaddingPopular,
      child: Text(
        materialFoodText,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Padding _buildRecipeTitle(BuildContext context, String recipeText) {
    return Padding(
      padding: spaceObjectPaddingPopular,
      child: Text(
        recipeText,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
