import 'package:afiyetlistesi/externalPackage/dotted_frame.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/view/Home/state/state_manage_home.dart';
import 'package:afiyetlistesi/view/Popular/page/popular_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/Favorite/page/favorite_page.dart';
import 'package:afiyetlistesi/view/Food/page/food_page.dart';

import 'package:afiyetlistesi/view/Profile/page/profile_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends StateManageHome {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      appBar: AppBar(
        title: Text(
          PageName.values[currentPage].getPageTitle(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: appBarManager.buildActionsForPage(
            currentPage: PageName.values[currentPage]),
      ),
      body: _buildPageViewWidget(),
      bottomNavigationBar: _BottomNavigationBarWidget(
        pageController: pageController,
        currentPage: currentPage,
      ),
      drawer: _BuildDrawerWidget(
        profilName: ProjectWords.profilName,
        profilEmail: ProjectWords.profilEmail,
        imageUrl: ProjectWords.profilPhotoUrl,
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
      children: [
        const PopularPageView(),
        const FavoritePageView(),
        ProfilePageView(
          isEditing: isEditing,
        ),
        const FoodPageView(),
      ],
    );
  }
}

class _BottomNavigationBarWidget extends StatefulWidget {
  final PageController _pageController;
  final int _currentPage;

  const _BottomNavigationBarWidget({
    required PageController pageController,
    required int currentPage,
  })  : _pageController = pageController,
        _currentPage = currentPage;

  @override
  State<_BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends State<_BottomNavigationBarWidget> {
  void _pageChangeBottomNav(int index) {
    setState(
      () {
        widget._pageController.animateToPage(
          index,
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageItemSize.bottomPadding,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: PageItemSize.bottomNavHeight,
        child: Card(
          elevation: PageItemSize.elevationValue,
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
                      ? PageColors.activeIconColor
                      : PageColors.deactiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(PageName.favorite.index);
                },
                icon: Icon(
                  Icons.favorite_rounded,
                  color: widget._currentPage == PageName.favorite.index
                      ? PageColors.activeIconColor
                      : PageColors.deactiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(PageName.profile.index);
                },
                icon: Icon(
                  Icons.person,
                  color: widget._currentPage == PageName.profile.index
                      ? PageColors.activeIconColor
                      : PageColors.deactiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(PageName.foods.index);
                },
                icon: Icon(
                  Icons.restaurant_rounded,
                  color: widget._currentPage == PageName.foods.index
                      ? PageColors.activeIconColor
                      : PageColors.deactiveIconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildDrawerWidget extends StatefulWidget {
  final String profilName;
  final String profilEmail;
  final String imageUrl;
  final PageController _pageController;

  const _BuildDrawerWidget({
    Key? key,
    required this.profilName,
    required this.profilEmail,
    required this.imageUrl,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  @override
  State<_BuildDrawerWidget> createState() => _BuildDrawerWidgetState();
}

class _BuildDrawerWidgetState extends State<_BuildDrawerWidget> {
  int _selectedOptionIndex = -1;
  final double aspectValue = 1;
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
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PageColors.mainPageColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: _BuildDrawerText(
              title: widget.profilName,
              limit: PageItemSize.textLimitx,
            ),
            accountEmail: _BuildDrawerText(
              title: widget.profilEmail,
              limit: PageItemSize.textLimit2x,
            ),
            currentAccountPicture: _buildDrawerPhoto(context),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(
                  image: AssetImage(ProjectPhotos.profilBannerUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: PageItemSize.listPadding2x,
            child: Column(
              children: [
                const Divider(
                  color: PageColors.profilTextColor,
                ),
                const SizedBox(
                  height: PageItemSize.spaceObjects,
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
      backgroundColor: PageColors.deactivedButtonColor,
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
                        child: const CircleAvatar(
                          backgroundColor: PageColors.deactivedButtonColor,
                          backgroundImage: AssetImage(
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

class _BuildDrawerText extends StatelessWidget {
  final String title;
  final int limit;

  const _BuildDrawerText({
    Key? key,
    required this.title,
    required this.limit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageItemSize.listPaddingx,
      child: Text(
        title.length <= limit ? title : '${title.substring(0, limit)}...',
        overflow: TextOverflow.ellipsis,
        maxLines: PageItemSize.drawerLines,
        softWrap: true,
        style: AppTheme().customTextTheme().titleSmall,
      ),
    );
  }
}

class _BuildDrawerOptions extends StatelessWidget {
  const _BuildDrawerOptions({
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
      elevation: PageItemSize.elevationValueOff,
      child: ListTile(
        leading: Icon(drawerIcon, color: PageColors.profilTextColor),
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
