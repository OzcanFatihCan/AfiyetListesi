import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';

class CardBottomNav extends StatelessWidget {
  const CardBottomNav({
    super.key,
    required PageController pageController,
    required int currentPage,
  })  : _pageController = pageController,
        _currentPage = currentPage;

  final PageController _pageController;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageItemSize.bottomPadding,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: PageItemSize.bottomNavHeight,
        child: Card(
          elevation: PageItemSize.elevationValue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              PageItemSize.fullRadius(),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomNavIconItem(
                0,
                Icons.home_rounded,
                _pageController,
                _currentPage,
              ),
              bottomNavIconItem(
                1,
                Icons.favorite_rounded,
                _pageController,
                _currentPage,
              ),
              bottomNavIconItem(
                2,
                Icons.person,
                _pageController,
                _currentPage,
              ),
              bottomNavIconItem(
                3,
                Icons.restaurant_rounded,
                _pageController,
                _currentPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bottomNavIconItem(
  int pageIndex,
  IconData icon,
  PageController pageControl,
  int current,
) {
  final pageController = pageControl;
  final currentPage = current;
  return IconButton(
    onPressed: () {
      pageController.animateToPage(
        pageIndex,
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
      );
    },
    icon: Icon(
      icon,
      color: currentPage == pageIndex
          ? PageColors.activeIconColor
          : PageColors.deactiveIconColor,
    ),
  );
}
