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
      width: MediaQuery.of(context).size.width * 0.52,
      child: GestureDetector(
        onTap: _itemDetailOnTap,
        child: Card(
          shape: Theme.of(context).cardTheme.shape,
          color: Theme.of(context).cardColor,
          child: Column(
            children: <Widget>[
              Padding(
                padding: imagePadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    halfRadius,
                  ),
                  child: _model.foodPhoto.isNotEmpty
                      ? Image.network(
                          _model.foodPhoto,
                          height: MediaQuery.of(context).size.height * 0.19,
                          width: MediaQuery.of(context).size.width * 0.38,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.19,
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.19,
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                ),
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
