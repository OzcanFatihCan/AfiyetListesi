part of '../page/popular_page.dart';

class _BuildPopularWidget extends StatefulWidget {
  const _BuildPopularWidget();

  @override
  State<_BuildPopularWidget> createState() => _BuildPopularWidgetState();
}

//popülerleri dışarıdan çekerken kontrol edilecek.
class _BuildPopularWidgetState extends State<_BuildPopularWidget>
    with _pageSize {
  late List<PopularFavoriteModel> _cardItems;
  @override
  void initState() {
    super.initState();
    _cardItems = PopularFavoriteItems().cardItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: listPaddingx,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.39,
        width: MediaQuery.of(context).size.width * 0.86,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _cardItems.length,
          itemBuilder: (context, index) {
            return _BuildPopularCard(model: _cardItems[index]);
          },
        ),
      ),
    );
  }
}

class _BuildPopularCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildPopularCard({
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.48,
      child: InkWell(
        onTap: () async {
          await NavigatorManager.instance
              .pushToPage(NavigateRoutes.foodDetail, arguments: _model);
        },
        child: Card(
          shape: Theme.of(context).cardTheme.shape,
          color: Theme.of(context).cardTheme.color,
          child: Column(
            children: <Widget>[
              Padding(
                padding: imagePadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(halfRadius),
                  child: _model.imagePath.isNotEmpty
                      ? Image.network(
                          _model.imagePath,
                          height: foodPhotoHeightSize,
                          width: foodPhotoWidthSize,
                          fit: BoxFit.fitHeight,
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
              SizedBox(
                height: spaceObjects,
              ),
              Text(
                softWrap: true,
                _model.title.isNotEmpty ? _model.title : foodNotFound,
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
