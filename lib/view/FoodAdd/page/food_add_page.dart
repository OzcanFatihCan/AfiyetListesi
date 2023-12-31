import 'dart:io';

import 'package:afiyetlistesi/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/large_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/constants/project_validate_regex.dart';
import 'package:afiyetlistesi/product/package/image/photo_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

part '../widget/food_add_photo_widget.dart';
part '../widget/food_add_text_widget.dart';
part '../widget/food_add_category_widget.dart';
part '../viewModel/state_manage_foodadd.dart';

class FoodAddPageView extends StatefulWidget {
  const FoodAddPageView({required this.myUser, super.key});
  final MyUser myUser;

  @override
  State<FoodAddPageView> createState() => _FoodAddPageViewState();
}

class _FoodAddPageViewState extends StateManageFoodAdd
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostSuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<CreatePostBloc, CreatePostState>(
        builder: (context, state) {
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
                      foodPhotoPick: foodPhoto,
                      onTap: () {
                        foodPhotoPicker();
                      },
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
                            _BuildFoodAddCategory(
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = newValue!;
                                });
                              },
                              selectedCategory: selectedCategory,
                            ),
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
            bottomNavigationBar: state is CreatePostLoading
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        ItemsofAsset.lottieLoading.fetchLottie,
                      ),
                    ),
                  )
                : _buildOnPressed(context),
          );
        },
      ),
    );
  }

  SizedBox _buildOnPressed(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Padding(
        padding: halfPadding,
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.100,
            width: MediaQuery.of(context).size.width,
            child: ButtonDecorationWidget(
              onPressed: () {
                if (_foodNameController.text.isNotEmpty &&
                    _materialController.text.isNotEmpty &&
                    _recipeController.text.isNotEmpty &&
                    foodPhoto != null &&
                    foodPhoto!.path.isNotNullOrNoEmpty &&
                    selectedCategory!.isNotEmpty) {
                  setState(() {
                    post.foodName = _foodNameController.text;
                    post.foodPhoto = foodPhoto!.path;
                    post.foodCategory = selectedCategory!;
                    post.foodRecipe = _recipeController.text;
                    post.foodMaterial = _materialController.text;
                  });
                  context.read<CreatePostBloc>().add(CreatePost(post));
                } else {
                  myErrorDialog(postError);
                }
              },
              buttonTitle: buttonTitle,
            ),
          ),
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
  final postError = "Lütfen fotoğraf ekleyin ve tüm boşlukları doldurun";
  final okButton = "Tamam";
  final alertTitle = "Uyarı";
}

mixin _pageSize {
  //obj
  final int maxLinesMaterials = 4;
  final int maxLengthMaterials = 1000;
  final int maxLinesRecipe = 6;
  final int maxLengthRecipe = 2000;
  final int maxLinesFood = 1;
  final int maxLengthFood = 100;
  final double thickness = 2;
  //duration
  final int snackBarDuration = 2;
  //radius
  final dropdownRadius = BorderRadius.circular(15);
  final alertRadius = BorderRadius.circular(25);

  //padding
  final EdgeInsets fullPadding = const EdgeInsets.symmetric(horizontal: 16);
  final EdgeInsets halfPadding = const EdgeInsets.all(8);
  final EdgeInsets objectPadding = const EdgeInsets.symmetric(vertical: 10);
  final EdgeInsets textFieldPadding = const EdgeInsets.only(top: 15);
  final EdgeInsets imageFieldPadding = const EdgeInsets.only(bottom: 15);
  final EdgeInsets iconPadding = const EdgeInsets.all(6);
  final EdgeInsets dropdownPadding = const EdgeInsets.symmetric(horizontal: 10);
}
