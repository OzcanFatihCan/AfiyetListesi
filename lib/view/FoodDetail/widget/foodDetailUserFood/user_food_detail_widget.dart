part of '../../page/food_detail_page.dart';

class _UserFoodDetailWidget extends StatefulWidget {
  const _UserFoodDetailWidget({
    required PopularFavoriteModel model,
  }) : _model = model;
  final PopularFavoriteModel _model;

  @override
  State<_UserFoodDetailWidget> createState() => _UserFoodDetailWidgetState();
}

class _UserFoodDetailWidgetState extends State<_UserFoodDetailWidget>
    with _pageSize, _pageWord {
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();
  //final TextEditingController _foodNameController = TextEditingController();
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned.fill(
                bottom: cardHeight / 2,
                child: _BuildFoodPhoto(model: widget._model),
              ),
              Positioned(
                  height: cardHeight,
                  width: cardWidth,
                  bottom: cardBottom,
                  child: _buildFoodTitle(context)),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: backLeft,
                bottom: backBottom,
                child: const _BackButtonWidget(),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                right: backRight,
                bottom: backBottom,
                child: _buildEditButton(context),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: pagePadding2x,
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildCategory(),
                    _BuildUserFoodDetailTextWidget(
                      materialController: _materialController,
                      recipeController: _recipeController,
                      model: widget._model,
                      isEditing: isEditing,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCategory() {
    return Padding(
      padding: spaceObjectsPadding,
      child: Text(
        "Kategori:${widget._model.category}",
        style: AppTheme().customTextTheme().labelMedium,
      ),
    );
  }

  Widget _buildFoodTitle(BuildContext context) {
    return isEditing
        ? Card(
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: TextFormField(
                autofocus: true,
              ),
            ),
          )
        : Card(
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: Text(
                widget._model.title.isNotEmpty
                    ? widget._model.title
                    : foodNotFound,
                style: AppTheme().customTextTheme().headlineSmall,
                softWrap: true,
                maxLines: maxLines,
              ),
            ),
          );
  }

  Row _buildEditButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          child: IconButton(
            icon: isEditing
                ? Icon(
                    Icons.check_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )
                : Icon(
                    Icons.edit_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            onPressed: () {
              setState(
                () {
                  isEditing = !isEditing;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
