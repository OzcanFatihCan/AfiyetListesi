part of '../page/user_food_page.dart';

abstract class StateManageUserFood extends State<UserFoodPageView>
    with _pageSize, _pageWord {
  PageController pageController = PageController();
  late List<Post> foodPosts;
  late String userId;
  late ValueNotifier<int> currentPageNotifier;
  final appText = "Yemeklerim";

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
}
