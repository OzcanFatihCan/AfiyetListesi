part of '../page/food_add_page.dart';

class _BuildFoodAddText extends StatefulWidget {
  const _BuildFoodAddText({
    required TextEditingController materialController,
    required TextEditingController recipeController,
    required TextEditingController foodNameController,
  })  : _materialController = materialController,
        _recipeController = recipeController,
        _foodNameController = foodNameController;

  final TextEditingController _materialController;
  final TextEditingController _recipeController;
  final TextEditingController _foodNameController;

  @override
  State<_BuildFoodAddText> createState() => __BuildFoodAddTextState();
}

class __BuildFoodAddTextState extends State<_BuildFoodAddText>
    with _pageSize, _pageWord {
  final GlobalKey _foodAddKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _foodAddKey,
      child: Column(
        children: [
          LargeTextField(
            textController: widget._foodNameController,
            hintText: foodNameHint,
            maxLength: maxLengthFood,
            maxLines: maxLinesFood,
          ),
          LargeTextField(
            textController: widget._materialController,
            hintText: materialHint,
            maxLength: maxLengthMaterials,
            maxLines: maxLinesMaterials,
          ),
          LargeTextField(
            textController: widget._recipeController,
            hintText: recipeHint,
            maxLines: maxLinesRecipe,
            maxLength: maxLengthRecipe,
          ),
        ],
      ),
    );
  }
}
