part of '../../page/food_detail_page.dart';

class _BuildUserFoodDetailTitleWidget extends StatelessWidget
    with _pageSize, _pageWord {
  _BuildUserFoodDetailTitleWidget({
    required Post model,
    required bool isEditing,
    required this.foodNameController,
  })  : _isEditing = isEditing,
        _model = model;

  final Post _model;
  final bool _isEditing;
  final TextEditingController? foodNameController;

  @override
  Widget build(BuildContext context) {
    foodNameController!.text = _model.foodName;
    return _isEditing
        ? Card(
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.46,
                child: TextFormField(
                  style: AppTheme().customTextTheme().headlineSmall,
                  controller: foodNameController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: foodTitleUnderlineWidth,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: foodTitleUnderlineWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Card(
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: Padding(
                padding: titlePadding,
                child: FittedBox(
                  child: Text(
                    _model.foodName.isNotEmpty ? _model.foodName : foodNotFound,
                    style: AppTheme().customTextTheme().headlineSmall,
                    softWrap: true,
                    maxLines: maxLines,
                  ),
                ),
              ),
            ),
          );
  }
}
