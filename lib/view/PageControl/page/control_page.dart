import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/draver_decoration.dart';
import 'package:afiyetlistesi/product/project_words.dart';

import 'package:afiyetlistesi/view/PageControl/widgets/control_widgets.dart';
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
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      appBar: AppBar(),
      body: controlPageViewFunc(),
      bottomNavigationBar: CardBottomNav(
        pageController: _pageController,
        currentPage: _currentPage,
      ),
      drawer: const DrawerDecoration(
        profilName: ProjectWords.profilName,
        profilEmail: ProjectWords.profilEmail,
        imageUrl: ProjectWords.profilPhotoUrl,
      ),
    );
  }

  PageView controlPageViewFunc() {
    return PageView(
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
    );
  }
}
