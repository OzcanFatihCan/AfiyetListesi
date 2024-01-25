part of '../page/home_page.dart';

class _BottomNavigationBarWidget extends StatefulWidget {
  const _BottomNavigationBarWidget({
    required PageController pageController,
    required int currentPage,
  })  : _pageController = pageController,
        _currentPage = currentPage;

  final PageController _pageController;
  final int _currentPage;

  @override
  State<_BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<_BottomNavigationBarWidget>
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
          elevation: elevationValueOff,
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
