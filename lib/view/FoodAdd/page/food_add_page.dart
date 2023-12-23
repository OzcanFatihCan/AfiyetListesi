import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/large_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_category.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:flutter/material.dart';
part '../widget/food_add_button_widget.dart';
part '../widget/food_add_category_widget.dart';
part '../widget/food_add_photo_widget.dart';
part '../widget/food_add_text_widget.dart';

class FoodAddPageView extends StatefulWidget {
  const FoodAddPageView({super.key});

  @override
  State<FoodAddPageView> createState() => _FoodAddPageViewState();
}

class _FoodAddPageViewState extends State<FoodAddPageView>
    with _pageSize, _pageWord {
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
        padding: fullPadding,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: _BuildFoodAddPhoto(
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: textFieldPadding,
                child: const _BuildFoodAddText(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Padding(
          padding: halfPadding,
          child: _BuildFoodAddButton(),
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
  final recipeHint = "Tarifi giriniz...";
  final categoryTitle = "Kategori seçiniz: ";
  final foodNameHint = "Yemek adı giriniz...";
}

mixin _pageSize {
  //obj
  final int maxLinesMaterials = 4;
  final int maxLengthMaterials = 600;
  final int maxLinesRecipe = 6;
  final int maxLengthRecipe = 2000;
  final int maxLinesFood = 1;
  final int maxLengthFood = 100;
  final double thickness = 2;
  //radius
  final dropdownRadius = BorderRadius.circular(15);

  //padding
  final EdgeInsets fullPadding = const EdgeInsets.symmetric(horizontal: 16);
  final EdgeInsets halfPadding = const EdgeInsets.all(8);
  final EdgeInsets objectPadding = const EdgeInsets.symmetric(vertical: 10);
  final EdgeInsets textFieldPadding = const EdgeInsets.only(top: 15);
  final EdgeInsets imageFieldPadding = const EdgeInsets.only(bottom: 15);
  final EdgeInsets iconPadding = const EdgeInsets.all(6);
}
