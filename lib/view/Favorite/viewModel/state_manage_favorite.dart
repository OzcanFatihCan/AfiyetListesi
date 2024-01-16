part of '../page/favorite_page.dart';

abstract class StateManageFavorite extends State<FavoritePageView>
    with _pageSize {
  PageController pageController = PageController();
  late List<FavoriteModel> favoritePosts;
  late ValueNotifier<int> currentPageNotifier;
  late String userId;
  int currentFav =
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek);

  @override
  void initState() {
    userId = context.read<AuthenticationBloc>().state.user!.uid;
    currentPageNotifier = ValueNotifier<int>(currentFav);
    super.initState();
  }

  void pageChange(int index) {
    setState(
      () {
        currentFav = index;
      },
    );
  }

  void contentChange(int currentFav) {
    setState(() {
      pageController.animateToPage(
        currentFav,
        duration: Duration(seconds: duration),
        curve: Curves.decelerate,
      );
    });
  }
}
