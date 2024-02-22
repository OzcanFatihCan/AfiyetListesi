part of '../../page/food_detail_page.dart';

class _PopularFoodDetailWidget extends StatefulWidget {
  const _PopularFoodDetailWidget({
    required PopularModel model,
  }) : _model = model;
  final PopularModel _model;

  @override
  State<_PopularFoodDetailWidget> createState() =>
      _PopularFoodDetailWidgetState();
}

class _PopularFoodDetailWidgetState extends State<_PopularFoodDetailWidget>
    with _pageSize, _pageWord {
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
                bottom: cardHeight / 1.4,
                child: _BuildPopularFoodPhoto(model: widget._model),
              ),
              Positioned(
                height: cardHeight,
                width: cardWidth,
                bottom: cardBottom,
                child: _buildFoodTitle(context),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: backLeft,
                bottom: backBottom,
                child: const _BackButtonWidget(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: pagePaddingx,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildMaterialTitle(context, materialFoodText),
                  _BuildPopularFoodMaterials(model: widget._model),
                  _buildRecipeTitle(context, recipeText),
                  _BuildPopularFoodRecipe(model: widget._model),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFoodTitle(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Card(
            margin: EdgeInsets.zero,
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: Text(
                widget._model.foodName.isNotEmpty
                    ? widget._model.foodName
                    : foodNotFound,
                style: AppTheme().customTextTheme().headlineSmall,
                softWrap: true,
                maxLines: maxLines,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
          width: MediaQuery.of(context).size.width * 0.40,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: halfRadius,
                bottomRight: halfRadius,
              ),
            ),
            child: Center(
              child: Text(
                "Kategori: ${widget._model.foodCategory}",
                style: AppTheme().customTextTheme().labelMedium,
                softWrap: true,
                maxLines: maxLines,
              ),
            ),
          ),
        ),
      ],
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
