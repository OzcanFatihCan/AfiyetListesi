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
  String? selectedCategory;
  CroppedFile? croppedFile;

  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();
  final TextEditingController _foodNameController = TextEditingController();
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
                child: _BuildUserFoodPhoto(
                  model: widget._model,
                  isEditing: isEditing,
                  croppedFile: croppedFile,
                ),
              ),
              Positioned(
                height: cardHeight,
                width: cardWidth,
                bottom: cardBottom,
                child: _buildFoodTitle(context),
              ),
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
              Positioned(
                bottom: iconPositionedBottom,
                right: iconPositionedRight,
                child: isEditing ? _buildPlusIcon() : const SizedBox(),
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
      child: Center(
        child: _BuildUserFoodCategory(
          onChanged: isEditing
              ? (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                }
              : null,
          selectedCategory: selectedCategory,
        ),
      ),
    );
  }

  Widget _buildFoodTitle(BuildContext context) {
    return isEditing
        ? Card(
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.46,
                child: TextFormField(
                  style: AppTheme().customTextTheme().headlineSmall,
                  controller: _foodNameController,
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

  Widget _buildPlusIcon() {
    return Container(
      padding: iconPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: GestureDetector(
        onTap: () {
          foodPhotoPicker();
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  foodPhotoPicker() async {
    ImagePickerHandler(
      context: context,
      onCroppedFile: (file) {
        setState(() {
          croppedFile = file;
        });
      },
    ).handleImageSelection();
  }
}
