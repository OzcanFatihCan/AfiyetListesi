enum FoodDetailType {
  userfood,
  food,
  popular,
  favorite,
}

extension FoodDetailTypeExtension on FoodDetailType {
  String getListTitle() {
    switch (this) {
      case FoodDetailType.userfood:
        return "UserFood";
      case FoodDetailType.food:
        return "Food";
      case FoodDetailType.popular:
        return "PopularFood";
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
