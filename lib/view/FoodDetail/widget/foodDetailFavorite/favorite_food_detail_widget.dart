part of '../../page/food_detail_page.dart';

class _FavoriteFoodDetailWidget extends StatefulWidget {
  const _FavoriteFoodDetailWidget({
    required FavoriteModel model,
  }) : _model = model;
  final FavoriteModel _model;

  @override
  State<_FavoriteFoodDetailWidget> createState() =>
      _FavoriteFoodDetailWidgetState();
}

class _FavoriteFoodDetailWidgetState extends State<_FavoriteFoodDetailWidget>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteFavoriteBloc, DeleteFavoriteState>(
      listener: (context, state) {
        if (state is DeleteFavoriteSuccess) {
          Navigator.pop(context, true);
        }
      },
      child: BlocBuilder<DeleteFavoriteBloc, DeleteFavoriteState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned.fill(
                      bottom: cardHeight / 1.4,
                      child: _BuildFavoriteFoodPhoto(model: widget._model),
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
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: pagePaddingx,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildMaterialTitle(context, materialFoodText),
                        _BuildFavoriteFoodMaterials(model: widget._model),
                        _buildRecipeTitle(context, recipeText),
                        _BuildFavoriteFoodRecipe(model: widget._model),
                        state is DeleteFavoriteLoading
                            ? Center(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.10,
                                  child: Lottie.asset(
                                    ItemsofAsset.lottieLoading.fetchLottie,
                                  ),
                                ),
                              )
                            : _BuildFavoriteFoodFavoriteButton(
                                onPressed: () {
                                  context.read<DeleteFavoriteBloc>().add(
                                        DeleteFavorite(
                                          userId:
                                              widget._model.favorite.myUser.id,
                                          favoriteId:
                                              widget._model.favorite.foodId,
                                        ),
                                      );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildFoodTitle(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Card(
            margin: EdgeInsets.zero,
            shape: Theme.of(context).cardTheme.shape,
            color: Theme.of(context).colorScheme.onPrimary,
            child: Center(
              child: Text(
                widget._model.favorite.foodName.isNotEmpty
                    ? widget._model.favorite.foodName
                    : foodNotFound,
                style: AppTheme().customTextTheme().headlineSmall,
                softWrap: true,
                maxLines: maxLines,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
          width: MediaQuery.of(context).size.width * 0.40,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: halfRadius,
                bottomRight: halfRadius,
              ),
            ),
            child: Center(
              child: Text(
                "Kategori: ${widget._model.favorite.foodCategory}",
                style: AppTheme().customTextTheme().labelMedium,
                softWrap: true,
                maxLines: maxLines,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildMaterialTitle(BuildContext context, String materialFoodText) {
    return Padding(
      padding: spaceObjectPaddingPopular,
      child: Text(
        materialFoodText,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Padding _buildRecipeTitle(BuildContext context, String recipeText) {
    return Padding(
      padding: spaceObjectPaddingPopular,
      child: Text(
        recipeText,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
