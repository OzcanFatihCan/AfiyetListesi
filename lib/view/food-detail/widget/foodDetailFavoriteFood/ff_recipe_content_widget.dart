part of '../../page/food_detail_page.dart';

class _BuildFavoriteFoodRecipe extends StatelessWidget
    with _pageSize, _pageWord {
  _BuildFavoriteFoodRecipe({
    required FavoriteModel model,
  }) : _model = model;

  final FavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Padding(
        padding: spaceObjectPaddingPopular,
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
                  _model.favorite.foodRecipe.isNotEmpty
                      ? _model.favorite.foodRecipe
                      : foodRecipeNotFound,
                  style: AppTheme().customTextTheme().labelMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
