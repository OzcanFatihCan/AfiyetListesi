part of '../page/user_food_page.dart';

class _PostBuilder extends StatelessWidget {
  const _PostBuilder({
    required this.pageController,
    required this.foodPosts,
    required this.userId,
    required this.widget,
    required this.userFoodError,
    required Function(
      List<Post> filteredModels,
      int modelIndex,
      BuildContext context,
    ) deletePostFunc,
    required Function(
      List<Post> filteredModels,
      int modelIndex,
      BuildContext context,
    ) detailPostFunc,
  })  : _deletePostFunc = deletePostFunc,
        _detailPostFunc = detailPostFunc;

  final PageController pageController;
  final List<Post> foodPosts;
  final String userId;
  final UserFoodPageView widget;
  final String userFoodError;
  final Function(
    List<Post> filteredModels,
    int modelIndex,
    BuildContext context,
  ) _deletePostFunc;
  final Function(
    List<Post> filteredModels,
    int modelIndex,
    BuildContext context,
  ) _detailPostFunc;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: CategoryManager.instance.getCategoryTitles().length,
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String category = CategoryManager.instance.getCategoryTitles()[index];
        List<Post> filteredModels =
            foodPosts.where((post) => post.foodCategory == category).toList();
        return filteredModels.isNotEmpty
            ? ListView.builder(
                itemCount: filteredModels.length,
                itemBuilder: (context, modelIndex) {
                  return _BuildUserFoodCard(
                    model: filteredModels[modelIndex],
                    itemDeleteOnPressed: () {
                      _deletePostFunc(filteredModels, modelIndex, context);
                    },
                    itemDetailOnTap: () async {
                      _detailPostFunc(filteredModels, modelIndex, context);
                      /*
                      await NavigatorManager.instance.pushToPageRotate(
                          NavigateRoutes.foodDetail,
                          arguments: {
                            'model': filteredModels[modelIndex],
                            'pageType':
                                FoodDetailManager.instance.getDetailType(
                              FoodDetailType.userfood,
                            ),
                            'myUser': widget.myUser,
                          }).then((value) {
                        if (value) {
                          context.read<GetPostBloc>().add(
                                GetPosts(userId: userId),
                              );
                        }
                      });*/
                    },
                  );
                },
              )
            : ErrorPageView(
                errorTitle: userFoodError,
                errorType: FoodErrorManager.instance.getErrorType(
                  FoodErrorType.specialFoodNotFound,
                ),
              );
      },
    );
  }
}
