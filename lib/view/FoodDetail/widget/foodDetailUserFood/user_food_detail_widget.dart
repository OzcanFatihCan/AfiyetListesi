part of '../../page/food_detail_page.dart';

class _UserFoodDetailWidget extends StatefulWidget {
  const _UserFoodDetailWidget({
    required Post model,
    required this.materialController,
    required this.recipeController,
    required this.foodNameController,
  }) : _model = model;

  final Post _model;
  final TextEditingController? materialController;
  final TextEditingController? recipeController;
  final TextEditingController? foodNameController;

  @override
  State<_UserFoodDetailWidget> createState() => _UserFoodDetailWidgetState();
}

class _UserFoodDetailWidgetState extends State<_UserFoodDetailWidget>
    with _pageSize, _pageWord {
  String? selectedCategory;
  File? foodPhoto;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget._model.foodCategory;
  }

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
                  foodPhotoPick: foodPhoto,
                ),
              ),
              Positioned(
                height: cardHeight,
                width: cardWidth,
                bottom: cardBottom,
                child: _BuildUserFoodDetailTitleWidget(
                  model: widget._model,
                  isEditing: isEditing,
                  foodNameController: widget.foodNameController,
                ),
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
                      model: widget._model,
                      isEditing: isEditing,
                      materialController: widget.materialController,
                      recipeController: widget.recipeController,
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
      pickerType: "FoodPhoto",
      onSelectionFile: (file) {
        setState(() {
          foodPhoto = file;
        });
      },
    ).handleImageSelection();
  }
}
