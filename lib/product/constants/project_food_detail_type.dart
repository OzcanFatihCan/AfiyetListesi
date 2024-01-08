enum FoodDetailType {
  userfood,
  mainFood,
  favorite,
}

extension FoodDetailTypeExtension on FoodDetailType {
  String getListTitle() {
    switch (this) {
      case FoodDetailType.userfood:
        return "UserFood";
      case FoodDetailType.mainFood:
        return "mainFood";
      case FoodDetailType.favorite:
        return "FavoriteFood";
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
