part of '../../page/food_detail_page.dart';

class _BuildFavoriteButton extends StatelessWidget with _pageWord {
  _BuildFavoriteButton({
    required Post model,
    required FavoriteModel favoritePost,
  })  : _model = model,
        _favoritePost = favoritePost;

  final Post _model;

  final FavoriteModel _favoritePost;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateFavoriteBloc(
        projectRepository: FirebaseProjectRepository(),
      ),
      child: Expanded(
        flex: 3,
        child: BlocBuilder<CreateFavoriteBloc, CreateFavoriteState>(
          builder: (context, state) {
            return state is CreateFavoriteLoading
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
                          _favoritePost.favorite.foodId = _model.foodId;
                          _favoritePost.favorite.foodName = _model.foodName;
                          _favoritePost.favorite.foodMaterial =
                              _model.foodMaterial;
                          _favoritePost.favorite.foodRecipe = _model.foodRecipe;
                          _favoritePost.favorite.foodCategory =
                              _model.foodCategory;
                          _favoritePost.favorite.foodPhoto = _model.foodPhoto;

                          context.read<CreateFavoriteBloc>().add(
                                CreateFavorite(favorite: _favoritePost),
                              );
                        },
                        buttonTitle: buttonTitle,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
