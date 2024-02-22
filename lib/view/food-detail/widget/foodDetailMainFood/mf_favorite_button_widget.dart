part of '../../page/food_detail_page.dart';

class _BuildMainFoodFavoriteButton extends StatefulWidget with _pageWord {
  _BuildMainFoodFavoriteButton({
    required Post model,
    required MyUser myUser,
  })  : _model = model,
        _myUser = myUser;

  final Post _model;

  final MyUser _myUser;

  @override
  State<_BuildMainFoodFavoriteButton> createState() =>
      _BuildMainFoodFavoriteButtonState();
}

class _BuildMainFoodFavoriteButtonState
    extends State<_BuildMainFoodFavoriteButton> with _pageWord {
  late FavoriteModel favoritePost;
  late List<FavoriteModel> getFavoritePost;
  @override
  void initState() {
    favoritePost = FavoriteModel.empty;
    favoritePost.favorite.myUser = widget._myUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: BlocBuilder<GetFavoriteBloc, GetFavoriteState>(
        builder: (context, getFavoriteState) {
          if (getFavoriteState is GetFavoriteSuccess) {
            getFavoritePost = getFavoriteState.favorite;
            List<FavoriteModel> deleteFavoritePost = getFavoritePost
                .where((value) => value.favorite.foodId == widget._model.foodId)
                .toList();

            return deleteFavoritePost.isNotEmpty
                ? BlocBuilder<DeleteFavoriteBloc, DeleteFavoriteState>(
                    builder: (context, deleteState) {
                      return deleteState is DeleteFavoriteLoading
                          ? Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Lottie.asset(
                                  ItemsofAsset.lottieLoading.fetchLottie,
                                ),
                              ),
                            )
                          : Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: ButtonDecorationWidget(
                                  onPressed: () {
                                    context.read<DeleteFavoriteBloc>().add(
                                          DeleteFavorite(
                                            userId: widget._myUser.id,
                                            favoriteId: deleteFavoritePost[0]
                                                .favorite
                                                .foodId,
                                          ),
                                        );
                                  },
                                  buttonTitle: buttonTitle2,
                                ),
                              ),
                            );
                    },
                  )
                : BlocBuilder<CreateFavoriteBloc, CreateFavoriteState>(
                    builder: (context, createState) {
                      return createState is CreateFavoriteLoading
                          ? Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Lottie.asset(
                                  ItemsofAsset.lottieLoading.fetchLottie,
                                ),
                              ),
                            )
                          : Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: ButtonDecorationWidget(
                                  onPressed: () {
                                    favoritePost.favorite.foodId =
                                        widget._model.foodId;
                                    favoritePost.favorite.foodName =
                                        widget._model.foodName;
                                    favoritePost.favorite.foodMaterial =
                                        widget._model.foodMaterial;
                                    favoritePost.favorite.foodRecipe =
                                        widget._model.foodRecipe;
                                    favoritePost.favorite.foodCategory =
                                        widget._model.foodCategory;
                                    favoritePost.favorite.foodPhoto =
                                        widget._model.foodPhoto;

                                    context.read<CreateFavoriteBloc>().add(
                                          CreateFavorite(
                                              favorite: favoritePost),
                                        );
                                  },
                                  buttonTitle: buttonTitle,
                                ),
                              ),
                            );
                    },
                  );
          } else {
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset(
                  ItemsofAsset.lottieLoading.fetchLottie,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
