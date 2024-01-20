enum FoodDetailType {
  userfood,
  mainFood,
  favoriteFood,
  popularFood,
}

extension FoodDetailTypeExtension on FoodDetailType {
  String getListTitle() {
    switch (this) {
      case FoodDetailType.userfood:
        return "userFood";
      case FoodDetailType.mainFood:
        return "mainFood";
      case FoodDetailType.favoriteFood:
        return "favoriteFood";
      case FoodDetailType.popularFood:
        return "popularFood";
      default:
        return "";
    }
  }
}

class FoodDetailManager {
  FoodDetailManager._();
  static FoodDetailManager instance = FoodDetailManager._();

  String getDetailType(FoodDetailType selectedType) {
    return selectedType.getListTitle();
  }
}
