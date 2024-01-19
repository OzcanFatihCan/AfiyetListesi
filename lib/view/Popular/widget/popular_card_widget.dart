part of '../page/popular_page.dart';

class _BuildPopularCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildPopularCard({
    required PopularModel model,
    required void Function()? itemDetailOnTap,
  })  : _model = model,
        _itemDetailOnTap = itemDetailOnTap;

  final PopularModel _model;
  final Function()? _itemDetailOnTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.48,
      child: InkWell(
        onTap: _itemDetailOnTap,
        child: Card(
          shape: Theme.of(context).cardTheme.shape,
          color: Theme.of(context).cardTheme.color,
          child: Column(
            children: <Widget>[
              Padding(
                padding: imagePadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(halfRadius),
                  child: _model.foodPhoto.isNotEmpty
                      ? Image.network(
                          _model.foodPhoto,
                          height: foodPhotoHeightSize,
                          width: foodPhotoWidthSize,
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              width: foodPhotoWidthSize,
                              height: foodPhotoHeightSize,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox(
                          height: foodPhotoHeightSize,
                          width: foodPhotoWidthSize,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: spaceObjects,
              ),
              Text(
                softWrap: true,
                _model.foodName.isNotEmpty ? _model.foodName : foodNotFound,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Padding(
                padding: pagePaddingx,
                child: Text(
                  subtitleText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
