part of '../page/popular_page.dart';

class _CategoryBuilderPopular extends StatelessWidget {
  const _CategoryBuilderPopular({
    super.key,
    required this.popularController,
    required this.popularPost,
    required this.widget,
    required this.populerError,
  });

  final PageController popularController;
  final List<PopularModel> popularPost;
  final PopularPageView widget;
  final String populerError;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: CategoryManager.instance.getCategoryTitles().length,
      controller: popularController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String category = CategoryManager.instance.getCategoryTitles()[index];
        List<PopularModel> filteredModels = popularPost
            .where(
              (value) => value.foodCategory == category,
            )
            .toList();

        return filteredModels.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredModels.length,
                itemBuilder: (context, modelIndex) {
                  return _BuildPopularCard(
                    model: filteredModels[modelIndex],
                    itemDetailOnTap: () async {
                      await NavigatorManager.instance
                          .pushToPage(NavigateRoutes.foodDetail, arguments: {
                        'model': filteredModels[modelIndex],
                        'pageType': FoodDetailManager.instance.getDetailType(
                          FoodDetailType.popularFood,
                        ),
                        'myUser': widget.myUser,
                      });
                    },
                  );
                },
              )
            : ErrorPageView(
                errorType: FoodErrorManager.instance.getErrorType(
                  FoodErrorType.specialFoodNotFound,
                ),
                errorTitle: populerError,
              );
      },
    );
  }
}
