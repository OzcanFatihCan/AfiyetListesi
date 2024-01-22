part of '../page/popular_page.dart';

class _SearchBuilderPopular extends StatelessWidget {
  const _SearchBuilderPopular({
    super.key,
    required this.popularController,
    required this.searchPost,
    required this.searchController,
    required this.widget,
    required this.populerError,
  });

  final PageController popularController;
  final List<PopularModel> searchPost;
  final TextEditingController searchController;
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
        List<PopularModel> searchModels = searchPost
            .where(
              (value) =>
                  value.foodCategory == category &&
                  value.foodName.toLowerCase().contains(
                        searchController.text.toLowerCase(),
                      ),
            )
            .toList();

        return searchModels.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: searchModels.length,
                itemBuilder: (context, modelIndex) {
                  return _BuildPopularCard(
                    model: searchModels[modelIndex],
                    itemDetailOnTap: () async {
                      await NavigatorManager.instance
                          .pushToPage(NavigateRoutes.foodDetail, arguments: {
                        'model': searchModels[modelIndex],
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
