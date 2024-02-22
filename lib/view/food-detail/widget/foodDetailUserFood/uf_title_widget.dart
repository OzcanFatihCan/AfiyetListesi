part of '../../page/food_detail_page.dart';

class _BuildUserFoodDetailTitleWidget extends StatefulWidget {
  const _BuildUserFoodDetailTitleWidget({
    required Post model,
    required bool isEditing,
    required this.foodNameController,
  })  : _isEditing = isEditing,
        _model = model;

  final Post _model;
  final bool _isEditing;
  final TextEditingController? foodNameController;

  @override
  State<_BuildUserFoodDetailTitleWidget> createState() =>
      _BuildUserFoodDetailTitleWidgetState();
}

class _BuildUserFoodDetailTitleWidgetState
    extends State<_BuildUserFoodDetailTitleWidget> with _pageSize, _pageWord {
  @override
  void initState() {
    super.initState();
    widget.foodNameController!.text = widget._model.foodName;
  }

  @override
  Widget build(BuildContext context) {
    return widget._isEditing
        ? Card(
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.46,
                child: TextFormField(
                  style: AppTheme().customTextTheme().headlineSmall,
                  controller: widget.foodNameController,
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
                    widget._model.foodName.isNotEmpty
                        ? widget._model.foodName
                        : foodNotFound,
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
