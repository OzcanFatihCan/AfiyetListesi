part of '../page/food_page.dart';

abstract class StateManageFood extends State<FoodPageView> {
  PageController pageController = PageController();
  bool isLoading = false;
  late List<Post> foodPosts;
  int currentFav =
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
  final int duration = 1;
  String mainId = dotenv.get("ADMIN_API", fallback: "ADMIN_API not found");

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void pageChange(int index) {
    setState(
      () {
        currentFav = index;
      },
    );
  }

  void contentChange(int currentFav) {
    setState(() {
      pageController.animateToPage(
        currentFav,
        duration: Duration(seconds: duration),
        curve: Curves.decelerate,
      );
    });
  }
}
