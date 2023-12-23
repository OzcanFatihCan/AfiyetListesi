part of '../page/food_add_page.dart';

class _BuildFoodAddText extends StatefulWidget {
  const _BuildFoodAddText();

  @override
  State<_BuildFoodAddText> createState() => __BuildFoodAddTextState();
}

class __BuildFoodAddTextState extends State<_BuildFoodAddText>
    with _pageSize, _pageWord {
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();
  final TextEditingController _foodNameController = TextEditingController();
  final GlobalKey _foodAddKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _foodAddKey,
        child: Column(
          children: [
            Divider(
              color: Theme.of(context).colorScheme.onPrimary,
              thickness: thickness,
            ),
            const _BuildFoodAddCategory(),
            LargeTextField(
              textController: _foodNameController,
              hintText: foodNameHint,
              maxLength: maxLengthFood,
              maxLines: maxLinesFood,
            ),
            LargeTextField(
              textController: _materialController,
              hintText: materialHint,
              maxLength: maxLengthMaterials,
              maxLines: maxLinesMaterials,
            ),
            LargeTextField(
              textController: _recipeController,
              hintText: recipeHint,
              maxLines: maxLinesRecipe,
              maxLength: maxLengthRecipe,
            ),
          ],
        ),
      ),
    );
  }
}
