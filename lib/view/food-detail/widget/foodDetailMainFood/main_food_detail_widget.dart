part of '../../page/food_detail_page.dart';

class _MainFoodDetailWidget extends StatelessWidget with _pageSize, _pageWord {
  _MainFoodDetailWidget({
    required Post model,
    required MyUser myUser,
  })  : _model = model,
        _myUser = myUser;
  final Post _model;
  final MyUser _myUser;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateFavoriteBloc(
            projectRepository: FirebaseProjectRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => DeleteFavoriteBloc(
            projectRepository: FirebaseProjectRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => GetFavoriteBloc(
            projectRepository: FirebaseProjectRepository(),
          )..add(
              GetFavorite(
                userId: _myUser.id,
              ),
            ),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DeleteFavoriteBloc, DeleteFavoriteState>(
            listener: (context, deleteFavoriteState) {
              if (deleteFavoriteState is DeleteFavoriteSuccess) {
                ToastService.showToast(
                  icon: Icons.check_circle,
                  message: favoriteDeleteSuccess,
                  context: context,
                );
                Navigator.pop(context, true);
              }
            },
          ),
          BlocListener<CreateFavoriteBloc, CreateFavoriteState>(
            listener: (context, createFavoriteState) {
              if (createFavoriteState is CreateFavoriteSuccess) {
                ToastService.showToast(
                  icon: Icons.check_circle,
                  message: favoriteAddSuccess,
                  context: context,
                );
                Navigator.pop(context, true);
              }
            },
          ),
        ],
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned.fill(
                    bottom: cardHeight / 1.4,
                    child: _BuildMainFoodPhoto(model: _model),
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
                      _BuildMainFoodMaterials(model: _model),
                      _buildRecipeTitle(context, recipeText),
                      _BuildMainFoodRecipe(model: _model),
                      _BuildMainFoodFavoriteButton(
                        model: _model,
                        myUser: _myUser,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
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
                _model.foodName.isNotEmpty ? _model.foodName : foodNotFound,
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
                "Kategori: ${_model.foodCategory}",
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
