part of '../page/popular_page.dart';

abstract class StateManagePopular extends State<PopularPageView>
    with _pageSize {
  PageController popularController = PageController();
  int currentFav =
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
  void _pageChangePopular(int index) {
    setState(
      () {
        widget._pageController.animateToPage(
          index,
          duration: Duration(seconds: duration),
          curve: Curves.decelerate,
        );
      },
    );
  }

  void popularChange(int index) {
    setState(
      () {
        currentFav = index;
      },
    );
  }

  void contentChange(int currentFav) {
    setState(() {
      popularController.animateToPage(
        currentFav,
        duration: Duration(seconds: duration),
        curve: Curves.decelerate,
      );
    });
  }
}
