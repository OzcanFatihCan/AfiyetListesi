part of '../../page/food_detail_page.dart';

class _BuildPopularFoodPhoto extends StatelessWidget with _pageSize, _pageWord {
  _BuildPopularFoodPhoto({
    required Post model,
  }) : _model = model;

  final Post _model;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'food-image-${_model.foodPhoto}',
      createRectTween: (Rect? begin, Rect? end) {
        return MaterialRectCenterArcTween(begin: end, end: begin);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.40,
        child: ClipRRect(
          borderRadius: foodDetailRadius,
          child: _model.foodPhoto.isNotEmpty
              ? Image.network(
                  _model.foodPhoto,
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
      ),
    );
  }
}
