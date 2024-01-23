part of '../page/user_food_page.dart';

abstract class StateManageUserFood extends State<UserFoodPageView>
    with _pageSize, _pageWord {
  PageController pageController = PageController();
  late List<Post> foodPosts;
  late String userId;
  late ValueNotifier<int> currentPageNotifier;

  @override
  void initState() {
    userId = context.read<AuthenticationBloc>().state.user!.uid;
    currentPageNotifier = ValueNotifier<int>(
        CategoryManager.instance.getCategoryIndex(CategoryName.yemek));
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

  postDeleteFunc(
    List<Post> filteredModels,
    int modelIndex,
    BuildContext context,
  ) {
    context.read<DeletePostBloc>().add(
          DeletePost(
            userId: userId,
            postId: filteredModels[modelIndex].foodId,
          ),
        );

    Navigator.pop(context);
  }

  postDetailFunc(
    List<Post> filteredModels,
    int modelIndex,
    BuildContext context,
  ) async {
    await NavigatorManager.instance
        .pushToPageRotate(NavigateRoutes.foodDetail, arguments: {
      'model': filteredModels[modelIndex],
      'pageType': FoodDetailManager.instance.getDetailType(
        FoodDetailType.userfood,
      ),
      'myUser': widget.myUser,
    }).then((value) {
      if (value) {
        context.read<GetPostBloc>().add(
              GetPosts(userId: userId),
            );
        currentPageNotifier.value =
            CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
      }
    });
  }
}
