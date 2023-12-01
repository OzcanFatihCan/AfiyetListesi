part of '../page/food_detail_page.dart';

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
