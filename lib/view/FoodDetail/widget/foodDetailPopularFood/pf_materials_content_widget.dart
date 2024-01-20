part of '../../page/food_detail_page.dart';

class _BuildPopularFoodMaterials extends StatelessWidget
    with _pageSize, _pageWord {
  _BuildPopularFoodMaterials({
    required PopularModel model,
  }) : _model = model;

  final PopularModel _model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: spaceObjectPaddingPopular,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            shape: AppTheme().customCardTheme().shape,
            color: Theme.of(context).cardTheme.color,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: objectPadding2x,
                child: Text(
                  _model.foodMaterial.isNotEmpty
                      ? _model.foodMaterial
                      : foodMaterialNotFound,
                  style: AppTheme().customTextTheme().labelMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
