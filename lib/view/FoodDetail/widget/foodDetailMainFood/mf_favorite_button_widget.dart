part of '../../page/food_detail_page.dart';

class _BuildFavoriteButton extends StatefulWidget with _pageWord {
  _BuildFavoriteButton({
    required Post model,
    required MyUser myUser,
  })  : _model = model,
        _myUser = myUser;

  final Post _model;

  final MyUser _myUser;

  @override
  State<_BuildFavoriteButton> createState() => _BuildFavoriteButtonState();
}

class _BuildFavoriteButtonState extends State<_BuildFavoriteButton>
    with _pageWord {
  late FavoriteModel favoritePost;
  @override
  void initState() {
    favoritePost = FavoriteModel.empty;
    favoritePost.favorite.myUser = widget._myUser;
    super.initState();
  }

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
                          favoritePost.favorite.foodId = widget._model.foodId;
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
                                CreateFavorite(favorite: favoritePost),
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
