import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:afiyetlistesi/product/constants/project_photo.dart';

part '../widget/special_food_error_widget.dart';
part '../widget/page_error_widget.dart';
part '../widget/food_error_widget.dart';

enum FoodErrorType {
  specialFoodNotFound,
  pageError,
  foodNotFound,
}

extension FoodErrorTypeExtension on FoodErrorType {
  String getListError() {
    switch (this) {
      case FoodErrorType.specialFoodNotFound:
        return "specialFoodNotFound";
      case FoodErrorType.pageError:
        return "pageError";
      case FoodErrorType.foodNotFound:
        return "foodNotFound";
      default:
        return "";
    }
  }
}

class FoodErrorManager {
  FoodErrorManager._();
  static FoodErrorManager instance = FoodErrorManager._();

  String getErrorType(FoodErrorType errorType) {
    return errorType.getListError();
  }
}

class ErrorPageView extends StatefulWidget {
  const ErrorPageView({
    this.errorType,
    this.errorTitle,
    super.key,
  });
  final String? errorType;
  final String? errorTitle;

  @override
  State<ErrorPageView> createState() => _ErrorPageViewState();
}

class _ErrorPageViewState extends State<ErrorPageView> with _pageItem {
  @override
  Widget build(BuildContext context) {
    Widget? detailWidget;
    if (widget.errorType ==
        FoodErrorManager.instance.getErrorType(
          FoodErrorType.specialFoodNotFound,
        )) {
      detailWidget = _SpecialFoodErrorWidget(errorTitle: widget.errorTitle!);
    } else if (widget.errorType ==
            FoodErrorManager.instance.getErrorType(FoodErrorType.pageError) ||
        widget.errorType == null) {
      detailWidget = _PageErrorWidget();
    } else if (widget.errorType ==
        FoodErrorManager.instance.getErrorType(FoodErrorType.foodNotFound)) {
      detailWidget = _FoodErrorWidget(errorTitle: widget.errorTitle!);
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: detailWidget,
    );
  }
}

mixin _pageItem {
  //padding
  final pagePaddingx = const EdgeInsets.all(8);
  final pagePadding2x = const EdgeInsets.all(16);

  //words
  final errorTitleNotFound = "Hata başlığı bulunamadı";
}
