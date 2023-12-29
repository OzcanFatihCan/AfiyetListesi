part of '../../page/food_detail_page.dart';

class _BuildUserFoodDetailTextWidget extends StatefulWidget {
  const _BuildUserFoodDetailTextWidget({
    required PopularFavoriteModel model,
    required TextEditingController materialController,
    required TextEditingController recipeController,
    required bool isEditing,
  })  : _model = model,
        _isEditing = isEditing,
        _materialController = materialController,
        _recipeController = recipeController;

  final TextEditingController _materialController;
  final TextEditingController _recipeController;
  final PopularFavoriteModel _model;
  final bool _isEditing;

  @override
  State<_BuildUserFoodDetailTextWidget> createState() =>
      __BuildUserFoodDetailTextWidgetState();
}

class __BuildUserFoodDetailTextWidgetState
    extends State<_BuildUserFoodDetailTextWidget> with _pageSize, _pageWord {
  final GlobalKey _userFoodKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _userFoodKey,
      child: widget._isEditing ? _buildTextEditable() : _buildTextFilled(),
    );
  }

  Column _buildTextEditable() {
    return Column(
      children: [
        _buildMaterialTitle(context, materialFoodText),
        LargeTextField(
          textController: widget._materialController,
          hintText: materialHint,
          maxLines: maxLinesMaterials,
          maxLength: maxLengthMaterials,
          isEditing: widget._isEditing,
        ),
        _buildRecipeTitle(context, recipeText),
        LargeTextField(
          textController: widget._recipeController,
          hintText: recipeHint,
          maxLines: maxLinesRecipe,
          maxLength: maxLengthRecipe,
          isEditing: widget._isEditing,
        ),
      ],
    );
  }

  Widget _buildTextFilled() {
    return Column(
      children: [
        _buildMaterialTitle(context, materialFoodText),
        Padding(
          padding: spaceObjectsPadding,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.164,
            child: Card(
              margin: cardMargin,
              shape: AppTheme().customCardTheme().shape,
              color: Theme.of(context).cardTheme.color,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: objectPadding2x,
                  child: Text(
                    widget._model.materialsFood.isNotEmpty
                        ? widget._model.materialsFood.join('\n')
                        : foodMaterialNotFound,
                    style: AppTheme().customTextTheme().labelMedium,
                  ),
                ),
              ),
            ),
          ),
        ),
        _buildRecipeTitle(context, recipeText),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.22,
          child: Card(
            margin: cardMargin,
            shape: AppTheme().customCardTheme().shape,
            color: Theme.of(context).cardTheme.color,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: objectPadding2x,
                child: Text(
                  widget._model.recipe.isNotEmpty
                      ? widget._model.recipe.join('\n')
                      : foodRecipeNotFound,
                  style: AppTheme().customTextTheme().labelMedium,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildMaterialTitle(BuildContext context, String materialFoodText) {
    return Padding(
      padding: spaceObjectsPadding,
      child: Text(
        materialFoodText,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Padding _buildRecipeTitle(BuildContext context, String recipeText) {
    return Padding(
      padding: spaceObjectsPadding,
      child: Text(
        recipeText,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
