class FavoriteModell {
  final String imagePath;
  final String title;
  final int category;
  final String recipe;

  FavoriteModell(
      {required this.imagePath,
      required this.title,
      required this.category,
      this.recipe = ""});
}
