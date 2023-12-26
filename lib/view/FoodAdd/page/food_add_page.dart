import 'dart:developer';

import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/large_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:flutter/material.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

part '../widget/food_add_photo_widget.dart';
part '../widget/food_add_text_widget.dart';

class FoodAddPageView extends StatefulWidget {
  const FoodAddPageView({required this.myUser, super.key});
  final MyUser myUser;

  @override
  State<FoodAddPageView> createState() => _FoodAddPageViewState();
}

class _FoodAddPageViewState extends State<FoodAddPageView>
    with _pageSize, _pageWord {
  late Post post;
  String? selectedCategory;
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();
  final TextEditingController _foodNameController = TextEditingController();

  @override
  void initState() {
    post = Post.empty;
    post.myUser = widget.myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(post.toString());
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        color: Theme.of(context).colorScheme.onPrimary,
                        thickness: thickness,
                      ),
                      _buildCategory(context),
                      _BuildFoodAddText(
                        foodNameController: _foodNameController,
                        recipeController: _recipeController,
                        materialController: _materialController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: Padding(
          padding: halfPadding,
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.100,
              width: MediaQuery.of(context).size.width,
              child: ButtonDecorationWidget(
                onPressed: () {
                  log(post.toString());
                },
                buttonTitle: buttonTitle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildCategory(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          categoryTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        DropdownButton<String>(
          icon: Icon(
            Icons.restaurant_menu_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          borderRadius: dropdownRadius,
          dropdownColor:
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
          style: Theme.of(context).textTheme.labelSmall,
          value: selectedCategory,
          onChanged: (String? newValue) {
            selectedCategory = newValue;
          },
          items: CategoryManager.instance
              .getCategoryTitles()
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            );
          }).toList(),
        ),
      ],
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
