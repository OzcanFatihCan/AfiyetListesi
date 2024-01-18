part of '../page/favorite_page.dart';

abstract class StateManageFavorite extends State<FavoritePageView>
    with _pageSize {
  PageController pageController = PageController();
  late List<FavoriteModel> favoritePosts;
  late ValueNotifier<int> currentPageNotifier;
  late String userId;

  @override
  void initState() {
    userId = context.read<AuthenticationBloc>().state.user!.uid;
    currentPageNotifier = ValueNotifier<int>(
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek),
    );
    super.initState();
  }

  void pageChange(int index) {
    setState(
      () {
        currentPageNotifier.value = index;
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

  favoriteDetailFunc(List<FavoriteModel> filteredModels, int modelIndex) async {
    await NavigatorManager.instance
        .pushToPageRotate(NavigateRoutes.foodDetail, arguments: {
      'model': filteredModels[modelIndex],
      'pageType': FoodDetailManager.instance.getDetailType(
        FoodDetailType.favorite,
      ),
      'myUser': widget.myUser,
    }).then((value) {
      if (value) {
        context.read<GetFavoriteBloc>().add(
              GetFavorite(userId: userId),
            );
        currentPageNotifier.value =
            CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
      }
    });
  }

  favoriteDeleteFunc(
    List<FavoriteModel> filteredModels,
    int modelIndex,
    BuildContext context,
  ) {
    context.read<DeleteFavoriteBloc>().add(
          DeleteFavorite(
            userId: userId,
            favoriteId: filteredModels[modelIndex].favorite.foodId,
          ),
        );
    context.read<DeleteFavoriteBloc>().stream.listen((deleteState) {
      if (deleteState is DeleteFavoriteSuccess) {
        context.read<GetFavoriteBloc>().add(
              GetFavorite(userId: userId),
            );
        currentPageNotifier.value =
            CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
      }
    });
    Navigator.pop(context);
  }
}
