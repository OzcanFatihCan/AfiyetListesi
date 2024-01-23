part of '../page/popular_page.dart';

class _SearchBuilderPopular extends StatelessWidget {
  const _SearchBuilderPopular({
    required this.popularController,
    required this.searchPost,
    required this.searchController,
    required this.widget,
    required this.populerError,
    required final Function(
      List<PopularModel> model,
      int modelIndex,
      BuildContext context,
    ) popularDetailFunc,
  }) : _popularDetailFunc = popularDetailFunc;

  final PageController popularController;
  final List<PopularModel> searchPost;
  final TextEditingController searchController;
  final PopularPageView widget;
  final String populerError;
  final Function(
    List<PopularModel> model,
    int modelIndex,
    BuildContext context,
  ) _popularDetailFunc;

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
                      _popularDetailFunc(
                        searchModels,
                        modelIndex,
                        context,
                      );
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
