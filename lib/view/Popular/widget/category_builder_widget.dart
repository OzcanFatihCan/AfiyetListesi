part of '../page/popular_page.dart';

class _CategoryBuilderPopular extends StatelessWidget {
  const _CategoryBuilderPopular({
    required this.popularController,
    required this.popularPost,
    required this.widget,
    required this.populerError,
    required Function(
      List<PopularModel> model,
      int modelIndex,
      BuildContext context,
    ) popularDetailFunc,
  }) : _popularDetailFunc = popularDetailFunc;

  final PageController popularController;
  final List<PopularModel> popularPost;
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
                      _popularDetailFunc(
                        filteredModels,
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
