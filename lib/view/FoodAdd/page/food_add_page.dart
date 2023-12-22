import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/large_text_field.dart';
import 'package:flutter/material.dart';
part '../widget/food_add_button_widget.dart';

class FoodAddPageView extends StatefulWidget {
  const FoodAddPageView({super.key});

  @override
  State<FoodAddPageView> createState() => _FoodAddPageViewState();
}

class _FoodAddPageViewState extends State<FoodAddPageView>
    with _pageSize, _pageWord {
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          pageName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: Stack(
                children: [],
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
            ),
            Expanded(flex: 1, child: _BuildFoodAddButton()),
          ],
        ),
      ),
    );
  }
}

mixin _pageWord {
  final pageName = "Yemek Ekle";
  final camName = "Kamera";
  final galleryName = "Galeri";
  final buttonTitle = "Yemek Ekle";
  final materialHint = "Malzemeleri giriniz...";
  final recipeHint = "Tarifi giriniz";
}

mixin _pageSize {
  //obj
  final int maxLinesMaterials = 5;
  final int maxLengthMaterials = 600;
  final int maxLinesRecipe = 7;
  final int maxLengthRecipe = 2000;

  //padding
  final EdgeInsets pagePadding = const EdgeInsets.all(16);
  final EdgeInsets objectPadding = const EdgeInsets.symmetric(vertical: 10);
}
