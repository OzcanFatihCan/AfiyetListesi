enum CategoryName { yemek, tatli, tursu, recel, icecek }

extension CategoryNameExtension on CategoryName {
  String getListTitle() {
    switch (this) {
      case CategoryName.yemek:
        return 'Yemek';
      case CategoryName.tatli:
        return 'Tatlı';
      case CategoryName.tursu:
        return 'Turşu';
      case CategoryName.recel:
        return 'Reçel';
      case CategoryName.icecek:
        return 'İçecek';
      default:
        return '';
    }
  }
}

class CategoryManager {
  CategoryManager._();
  static CategoryManager instance = CategoryManager._();

  List<String> getCategoryTitles() {
    return CategoryName.values
        .map((category) => category.getListTitle())
        .toList();
  }

  int getCategoryIndex(CategoryName category) {
    return category.index;
  }
}
