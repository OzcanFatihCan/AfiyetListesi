import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/view/Favorite/page/favorite_page.dart';
import 'package:afiyetlistesi/view/Food/page/food_page.dart';
import 'package:afiyetlistesi/view/Home/page/home_page.dart';
import 'package:afiyetlistesi/view/Person/page/persone_page.dart';

class PageControlView extends StatefulWidget {
  const PageControlView({Key? key}) : super(key: key);

  @override
  State<PageControlView> createState() => _PageControlViewState();
}

class _PageControlViewState extends State<PageControlView> {
  final _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0; // Başlangıçta ilk sayfa (Home) görüntülenecek.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: const [
          HomePageView(),
          FavoritePageView(),
          PersonPageView(),
          FoodPageView(),
        ],
      ),
      bottomNavigationBar: CardBottomNav(
        pageController: _pageController,
        currentPage: _currentPage,
      ),
      drawer: Drawer(
        backgroundColor: PageColors.mainPageColor,
      ),
    );
  }
}

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
 /*
                buildNavBarItem(0, Icons.home_rounded),
                buildNavBarItem(1, Icons.favorite_rounded),
                buildNavBarItem(2, Icons.person),
                buildNavBarItem(3, Icons.restaurant_rounded),*/