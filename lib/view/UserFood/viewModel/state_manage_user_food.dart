part of '../page/user_food_page.dart';

abstract class StateManageUserFood extends State<UserFoodPageView>
    with _pageSize, _pageWord {
  PageController pageController = PageController();
  late List<Post> foodPosts;
  late String userId;
  final appText = "Yemeklerim";
  int currentFav =
      CategoryManager.instance.getCategoryIndex(CategoryName.yemek);

  @override
  void initState() {
    userId = context.read<AuthenticationBloc>().state.user!.uid;
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
