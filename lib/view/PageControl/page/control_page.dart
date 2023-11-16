import 'package:afiyetlistesi/core/color_set.dart';
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
          // Sayfa değiştiğinde çağrılır
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: SizedBox(
          width: 250,
          height: 70,
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35.0), // İstediğiniz yuvarlaklık değeri
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavBarItem(0, Icons.home_rounded),
                _buildNavBarItem(1, Icons.favorite_rounded),
                _buildNavBarItem(2, Icons.person),
                _buildNavBarItem(3, Icons.restaurant_rounded),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: PageColors.mainPageColor,
      ),
    );
  }

  Widget _buildNavBarItem(int pageIndex, IconData icon) {
    return IconButton(
      onPressed: () {
        _pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
      icon: Icon(
        icon,
        color: _currentPage == pageIndex ? Colors.blue : Colors.grey,
      ),
    );
  }
}
