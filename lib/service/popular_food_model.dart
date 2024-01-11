class PopularFavoriteModel {
  final int id;
  final String imagePath;
  final String title;
  final int category;
  final List<dynamic> materialsFood;
  final List<dynamic> recipe;

  PopularFavoriteModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.category,
    this.materialsFood = const [],
    this.recipe = const [],
  });
}
