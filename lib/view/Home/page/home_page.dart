import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/externalPackage/dotted_frame.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/view/Popular/page/popular_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/Favorite/page/favorite_page.dart';
import 'package:afiyetlistesi/view/Food/page/food_page.dart';

import 'package:afiyetlistesi/view/Person/page/persone_page.dart';

class PageControlView extends StatefulWidget {
  const PageControlView({Key? key}) : super(key: key);

  @override
  State<PageControlView> createState() => _PageControlViewState();
}

class _PageControlViewState extends State<PageControlView> {
  final _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = _PageName.popular.index;
  bool _isEditing = false;

//profil func
  void _changeLoading() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _pageChange(int index) {
    setState(
      () {
        _currentPage = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      appBar: AppBar(
        title: Text(_getPageTitle(_currentPage)),
        actions: _currentPage == _PageName.profile.index
            ? [
                _buildProfileAppbar(),
              ]
            : [],
      ),
      body: _buildPageViewWidget(),
      bottomNavigationBar: _BottomNavigationBarWidget(
        pageController: _pageController,
        currentPage: _currentPage,
      ),
      drawer: _BuildDrawerWidget(
        profilName: ProjectWords.profilName,
        profilEmail: ProjectWords.profilEmail,
        imageUrl: ProjectWords.profilPhotoUrl,
        pageController: _pageController,
      ),
    );
  }

  IconButton _buildProfileAppbar() {
    return IconButton(
      icon: _isEditing
          ? const Icon(Icons.check_rounded)
          : const Icon(Icons.edit_rounded),
      onPressed: () {
        _changeLoading();
      },
    );
  }

  PageView _buildPageViewWidget() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (int index) {
        _pageChange(index);
      },
      children: [
        const PopularPageView(),
        const FavoritePageView(),
        PersonPageView(
          isEditing: _isEditing,
        ),
        const FoodPageView(),
      ],
    );
  }

  String _getPageTitle(int page) {
    switch (page) {
      case 0:
        return 'Anasayfa';
      case 1:
        return 'Favoriler';
      case 2:
        return 'Profil';
      case 3:
        return 'Yemekler';
      default:
        return '';
    }
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              PageItemSize.fullRadius(),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(_PageName.popular.index);
                },
                icon: Icon(
                  Icons.home_rounded,
                  color: widget._currentPage == _PageName.popular.index
                      ? PageColors.activeIconColor
                      : PageColors.deactiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(_PageName.favorite.index);
                },
                icon: Icon(
                  Icons.favorite_rounded,
                  color: widget._currentPage == _PageName.favorite.index
                      ? PageColors.activeIconColor
                      : PageColors.deactiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(_PageName.profile.index);
                },
                icon: Icon(
                  Icons.person,
                  color: widget._currentPage == _PageName.profile.index
                      ? PageColors.activeIconColor
                      : PageColors.deactiveIconColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  _pageChangeBottomNav(_PageName.foods.index);
                },
                icon: Icon(
                  Icons.restaurant_rounded,
                  color: widget._currentPage == _PageName.foods.index
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
            currentAccountPicture: CircleAvatar(
              backgroundColor: PageColors.deactivedButtonColor,
              child: DottedFrame(
                child: ClipOval(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: InkWell(
                      onTap: () {
                        _pageChangeDrawer(_PageName.profile.index);
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
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.80,
                                child: const CircleAvatar(
                                  backgroundColor:
                                      PageColors.deactivedButtonColor,
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
            ),
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
                  drawerChoice: ProjectWords
                      .drawerListItem[_ListItemName.yemekEkle.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.yemekEkle.index);
                  },
                  isSelected:
                      _selectedOptionIndex == _ListItemName.yemekEkle.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.local_restaurant_rounded,
                  drawerChoice: ProjectWords
                      .drawerListItem[_ListItemName.yemeklerim.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.yemeklerim.index);
                  },
                  isSelected:
                      _selectedOptionIndex == _ListItemName.yemeklerim.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.favorite_rounded,
                  drawerChoice: ProjectWords
                      .drawerListItem[_ListItemName.favorilerim.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.favorilerim.index);
                    _pageChangeDrawer(_PageName.favorite.index);
                    Navigator.pop(context);
                  },
                  isSelected:
                      _selectedOptionIndex == _ListItemName.favorilerim.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.settings_rounded,
                  drawerChoice:
                      ProjectWords.drawerListItem[_ListItemName.ayarlar.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.ayarlar.index);
                    _pageChangeDrawer(_PageName.profile.index);
                    Navigator.pop(context);
                  },
                  isSelected:
                      _selectedOptionIndex == _ListItemName.ayarlar.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.exit_to_app_rounded,
                  drawerChoice:
                      ProjectWords.drawerListItem[_ListItemName.cikisYap.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.cikisYap.index);
                  },
                  isSelected:
                      _selectedOptionIndex == _ListItemName.cikisYap.index,
                ),
              ],
            ),
          ),
        ],
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
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: PageColors.profilTextColor,
              fontWeight: PageFont.textFont,
            ),
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
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: PageColors.cardColor,
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.halfRadius(),
        ),
      ),
      color: isSelected
          ? PageColors.activeButtonColor2
          : PageColors.deactivedButtonColor,
      elevation: PageItemSize.elevationValueOff,
      child: ListTile(
        leading: Icon(drawerIcon, color: PageColors.profilTextColor),
        title: Text(
          drawerChoice,
          softWrap: true,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: PageColors.profilTextColor,
                fontWeight: PageFont.textFont,
              ),
        ),
        onTap: onTap,
      ),
    );
  }
}

enum _PageName { popular, favorite, profile, foods }

enum _ListItemName { yemekEkle, yemeklerim, favorilerim, ayarlar, cikisYap }
