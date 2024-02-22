part of '../../page/food_detail_page.dart';

class _BuildUserFoodPhoto extends StatefulWidget {
  const _BuildUserFoodPhoto({
    required Post model,
    required bool isEditing,
    required this.foodPhotoPick,
  })  : _model = model,
        _isEditing = isEditing;

  final Post _model;

  final bool _isEditing;
  final File? foodPhotoPick;

  @override
  State<_BuildUserFoodPhoto> createState() => _BuildUserFoodPhotoState();
}

class _BuildUserFoodPhotoState extends State<_BuildUserFoodPhoto>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'food-image-${widget._model.foodPhoto}',
      createRectTween: (Rect? begin, Rect? end) {
        return MaterialRectCenterArcTween(begin: end, end: begin);
      },
      child: widget._isEditing
          ? _buildPhotoEditable(context)
          : _buildPhotoFilled(context),
    );
  }

  Widget _buildPhotoEditable(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      child: ClipRRect(
        borderRadius: foodDetailRadius,
        child: widget.foodPhotoPick != null
            ? Image.file(
                File(widget.foodPhotoPick!.path),
                height: foodPhotoHeightSize,
                width: foodPhotoWidthSize,
                fit: BoxFit.cover,
              )
            : (widget._model.foodPhoto.isNotEmpty
                ? Image.network(
                    widget._model.foodPhoto,
                    height: foodPhotoHeightSize,
                    width: foodPhotoWidthSize,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }

  SizedBox _buildPhotoFilled(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      child: ClipRRect(
        borderRadius: foodDetailRadius,
        child: widget._model.foodPhoto.isNotEmpty
            ? Image.network(
                widget._model.foodPhoto,
                height: foodPhotoHeightSize,
                width: foodPhotoWidthSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    width: foodPhotoWidthSize,
                    height: foodPhotoHeightSize,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              )
            : SizedBox(
                height: foodPhotoHeightSize,
                width: foodPhotoWidthSize,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
