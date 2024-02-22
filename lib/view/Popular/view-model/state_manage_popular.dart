part of '../page/popular_page.dart';

abstract class StateManagePopular extends State<PopularPageView>
    with _pageSize {
  TextEditingController searchController = TextEditingController();

  PageController popularController = PageController();
  late ValueNotifier<int> currentPageNotifier;
  late List<PopularModel> popularPost;
  late List<PopularModel> searchPost;
  int currentFav =
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek);

  @override
  void initState() {
    currentPageNotifier = ValueNotifier<int>(
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek),
    );
    super.initState();
  }

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

  void popularChange(int index) {
    setState(
      () {
        currentPageNotifier.value = index;
      },
    );
  }

  void contentChange(int currentFav) {
    if (popularController.positions.isNotEmpty) {
      if (popularController.page != currentFav) {
        setState(() {
          popularController.animateToPage(
            currentFav,
            duration: Duration(seconds: duration),
            curve: Curves.decelerate,
          );
        });
      }
    }
  }

  popularDetailFunc(
    List<PopularModel> model,
    int modelIndex,
    BuildContext context,
  ) async {
    await NavigatorManager.instance
        .pushToPage(NavigateRoutes.foodDetail, arguments: {
      'model': model[modelIndex],
      'pageType': FoodDetailManager.instance.getDetailType(
        FoodDetailType.popularFood,
      ),
      'myUser': widget.myUser,
    });
  }
}
