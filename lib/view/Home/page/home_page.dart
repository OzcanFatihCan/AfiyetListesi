import 'package:afiyetlistesi/externalPackage/dotted_frame.dart';

import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/view/Home/state/state_manage_home.dart';
import 'package:afiyetlistesi/view/Popular/page/popular_page.dart';
import 'package:afiyetlistesi/view/Favorite/page/favorite_page.dart';
import 'package:afiyetlistesi/view/Food/page/food_page.dart';
import 'package:afiyetlistesi/view/Profile/page/profile_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends StateManageHome with _pageWords {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          PageName.values[currentPage].getPageTitle(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: _buildPageViewWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(
        pageController: pageController,
        currentPage: currentPage,
      ),
      drawer: BuildDrawerWidget(
        profilName: profilName,
        profilEmail: profilEmail,
        imageUrl: profilPhotoUrl,
        pageController: pageController,
      ),
    );
  }

  PageView _buildPageViewWidget() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (int index) {
        pageChange(index);
      },
      children: const [
        PopularPageView(),
        FavoritePageView(),
        ProfilePageView(),
        FoodPageView(),
      ],
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
    required PageController pageController,
    required int currentPage,
  })  : _pageController = pageController,
        _currentPage = currentPage;

  final PageController _pageController;
  final int _currentPage;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget>
    with _pageSize, _pageDuration {
  void _pageChangeBottomNav(int index) {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bottomPadding,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: bottomNavHeight,
        child: Card(
          elevation: elevationValue,
          shape: Theme.of(context).cardTheme.shape,
          color: Theme.of(context).cardTheme.color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(PageName.popular.index);
                },
                icon: Icon(
                  Icons.home_rounded,
                  color: widget._currentPage == PageName.popular.index
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(PageName.favorite.index);
                },
                icon: Icon(
                  Icons.favorite_rounded,
                  color: widget._currentPage == PageName.favorite.index
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(PageName.profile.index);
                },
                icon: Icon(
                  Icons.person,
                  color: widget._currentPage == PageName.profile.index
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(PageName.foods.index);
                },
                icon: Icon(
                  Icons.restaurant_rounded,
                  color: widget._currentPage == PageName.foods.index
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildDrawerWidget extends StatefulWidget {
  final String profilName;
  final String profilEmail;
  final String imageUrl;
  final PageController _pageController;

  const BuildDrawerWidget({
    Key? key,
    required this.profilName,
    required this.profilEmail,
    required this.imageUrl,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  @override
  State<BuildDrawerWidget> createState() => BuildDrawerWidgetState();
}

class BuildDrawerWidgetState extends State<BuildDrawerWidget>
    with _pageSize, _pageDuration {
  int _selectedOptionIndex = -1;
  void _updateSelectedOption(int index) {
    setState(() {
      _selectedOptionIndex = index;
    });
  }

  void _pageChangeDrawer(int index) {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: _BuildDrawerText(
              title: widget.profilName,
              limit: textLimitx,
            ),
            accountEmail: _BuildDrawerText(
              title: widget.profilEmail,
              limit: textLimit2x,
            ),
            currentAccountPicture: _buildDrawerPhoto(context),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              image: const DecorationImage(
                  image: AssetImage(ProjectPhotos.profilBannerUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: listPadding2x,
            child: Column(
              children: [
                Divider(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(
                  height: spaceObjects,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.assignment_add,
                  drawerChoice: ListItemName
                      .values[ListItemName.yemekEkle.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.yemekEkle.index);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.yemekEkle.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.local_restaurant_rounded,
                  drawerChoice: ListItemName
                      .values[ListItemName.yemeklerim.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.yemeklerim.index);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.yemeklerim.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.favorite_rounded,
                  drawerChoice: ListItemName
                      .values[ListItemName.favorilerim.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.favorilerim.index);
                    _pageChangeDrawer(PageName.favorite.index);
                    Navigator.pop(context);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.favorilerim.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.settings_rounded,
                  drawerChoice: ListItemName.values[ListItemName.ayarlar.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.ayarlar.index);
                    _pageChangeDrawer(PageName.profile.index);
                    Navigator.pop(context);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.ayarlar.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.exit_to_app_rounded,
                  drawerChoice: ListItemName.values[ListItemName.cikisYap.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.cikisYap.index);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.cikisYap.index,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar _buildDrawerPhoto(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: DottedFrame(
        child: ClipOval(
          child: AspectRatio(
            aspectRatio: aspectValue,
            child: InkWell(
              onTap: () {
                _pageChangeDrawer(PageName.profile.index);
                Navigator.pop(context);
              },
              child: widget.imageUrl.isNotEmpty
                  ? Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )
                  : Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          backgroundImage: const AssetImage(
                            ProjectPhotos.profilPhotoUpdateUrl,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildDrawerText extends StatelessWidget with _pageSize {
  final String title;
  final int limit;

  _BuildDrawerText({
    Key? key,
    required this.title,
    required this.limit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: listPaddingx,
      child: Text(
        title.length <= limit ? title : '${title.substring(0, limit)}...',
        overflow: TextOverflow.ellipsis,
        maxLines: drawerLines,
        softWrap: true,
        style: AppTheme().customTextTheme().titleSmall,
      ),
    );
  }
}

class _BuildDrawerOptions extends StatelessWidget with _pageSize {
  _BuildDrawerOptions({
    Key? key,
    required this.drawerIcon,
    required this.drawerChoice,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final IconData drawerIcon;
  final String drawerChoice;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppTheme().customCardTheme().shape,
      color: Theme.of(context).cardTheme.color,
      elevation: elevationValueOff,
      child: ListTile(
        leading: Icon(
          drawerIcon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          drawerChoice,
          softWrap: true,
          style: AppTheme().customTextTheme().titleLarge,
        ),
        onTap: onTap,
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final int drawerLines = 1;
  final double spaceObjects = 20;
  final int textLimitx = 35;
  final int textLimit2x = 50;
  final double bottomNavHeight = 60;
  final double aspectValue = 1;
//padding
  final listPadding2x = const EdgeInsets.symmetric(horizontal: 15);
  final listPaddingx = const EdgeInsets.symmetric(horizontal: 10);
  final bottomPadding = const EdgeInsets.only(bottom: 25, right: 20, left: 20);

  //elevation
  final double elevationValueOff = 0;
  final double elevationValue = 8;
}

mixin _pageDuration {
  final duration = 1;
}

mixin _pageWords {
  final profilName = "Elizabeth Olsen";
  final profilEmail = "ElizabethOlsen@gmail.com";
  final profilPhotoUrl =
      "https://image.tmdb.org/t/p/original/mbMsmQE5CyMVTIGMGCw2XpcPCOc.jpg";
}
