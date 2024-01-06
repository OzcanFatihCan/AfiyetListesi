part of '../../page/food_detail_page.dart';

class _BuildUserFoodDetailTextWidget extends StatefulWidget {
  const _BuildUserFoodDetailTextWidget({
    required Post model,
    required this.materialController,
    required this.recipeController,
    required bool isEditing,
  })  : _model = model,
        _isEditing = isEditing;

  final TextEditingController? materialController;
  final TextEditingController? recipeController;
  final Post _model;
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
          hintText: materialHint,
          maxLines: maxLinesMaterials,
          maxLength: maxLengthMaterials,
          isEditing: widget._isEditing,
          textController: widget.materialController,
        ),
        _buildRecipeTitle(context, recipeText),
        LargeTextField(
          hintText: recipeHint,
          maxLines: maxLinesRecipe,
          maxLength: maxLengthRecipe,
          isEditing: widget._isEditing,
          textController: widget.recipeController,
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
                    widget._model.foodMaterial.isNotEmpty
                        ? widget._model.foodMaterial
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
                  widget._model.foodRecipe.isNotEmpty
                      ? widget._model.foodRecipe
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
