part of '../page/popular_page.dart';

abstract class StateManagePopular extends State<PopularPageView>
    with _pageSize {
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
}
