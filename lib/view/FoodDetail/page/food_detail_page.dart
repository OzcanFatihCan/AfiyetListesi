import 'dart:io';

import 'package:afiyetlistesi/product/components/text/large_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_food_detail_type.dart';
import 'package:afiyetlistesi/product/package/image/photo_picker.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/view/Error/page/error_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:post_repository/post_repository.dart';

part '../viewModel/state_manage_food_detail.dart';

part '../widget/foodDetailMainFood/mf_food_photo_widget.dart';
part '../widget/back_button_widget.dart';
part '../widget/foodDetailMainFood/mf_favorite_button_widget.dart';
part '../widget/foodDetailMainFood/mf_materials_content_widget.dart';
part '../widget/foodDetailMainFood/mf_recipe_content_widget.dart';
part '../widget/foodDetailUserFood/uf_text_widget.dart';
part '../widget/foodDetailUserFood/uf_category_widget.dart';
part '../widget/foodDetailUserFood/uf_food_photo_widget.dart';
part '../widget/foodDetailUserFood/uf_title_widget.dart';

part '../widget/foodDetailMainFood/main_food_detail_widget.dart';
part '../widget/foodDetailUserFood/user_food_detail_widget.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({
    super.key,
    required Post model,
    required String pageType,
  })  : _model = model,
        _pageType = pageType;

  final Post _model;
  final String _pageType;

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends StateManageFoodDetail
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    if (widget._pageType ==
        FoodDetailManager.instance.getDetailType(FoodDetailType.userfood)) {
      detailWidget = _UserFoodDetailWidget(
        model: widget._model,
        foodNameController: foodNameController,
        materialController: materialController,
        recipeController: recipeController,
      );
    } else if (widget._pageType ==
        FoodDetailManager.instance.getDetailType(FoodDetailType.mainFood)) {
      detailWidget = _MainFoodDetailWidget(model: widget._model);
    } else if (widget._pageType ==
        FoodDetailManager.instance.getDetailType(FoodDetailType.favorite)) {
      detailWidget = Container();
    } else {
      detailWidget = const ErrorPageView();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: detailWidget,
    );
  }
}

mixin _pageSize {
  //obj
  final int maxLinesMaterials = 4;
  final int maxLengthMaterials = 1000;
  final int maxLinesRecipe = 6;
  final int maxLengthRecipe = 2000;
  final int maxLengthFood = 100;
  final cardHeight = 70.0;
  final cardWidth = 230.0;
  final cardBottom = 0.0;

  final backLeft = 20.0;
  final backRight = 20.0;
  final backBottom = 200.0;
  final maxLines = 2;
  final double foodPhotoHeightSize = 130;
  final double foodPhotoWidthSize = 120;
  final double spaceObjectsMin = 10;
  final double foodTitleUnderlineWidth = 2;

  final double iconPositionedBottom = 20;
  final double iconPositionedRight = 20;

  //radius
  final halfRadius = const Radius.circular(15);
  final foodDetailRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );
  final dropdownRadius = BorderRadius.circular(15);
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
  final objectPadding2x = const EdgeInsets.all(16.0);
  final spaceObjectPaddingPopular = const EdgeInsets.only(bottom: 7);
  final spaceObjectsPadding = const EdgeInsets.only(bottom: 22);
  final EdgeInsets iconPadding = const EdgeInsets.all(6);
  final cardMargin = const EdgeInsets.all(0);
  final titlePadding = const EdgeInsets.symmetric(horizontal: 8);
}

mixin _pageWord {
  final categoryTitle = "Kategori: ";
  final materialHint = "Malzemeleri giriniz...";
  final recipeHint = "Tarifi giriniz...";
  final subtitleText = "Tarif için tıkla";
  final foodNotFound = "Yemek adı yükleniyor...";
  final foodRecipeNotFound = "Yemek tarifi yükleniyor...";
  final buttonTitle = "Favoriye Ekle";
  final materialFoodText = "Malzemeler";
  final recipeText = "Yapılışı";
  final foodMaterialNotFound = "Yemek malzeme yükleniyor...";
}
