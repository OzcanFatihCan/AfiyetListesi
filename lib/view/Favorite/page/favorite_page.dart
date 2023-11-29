import 'package:afiyetlistesi/view/Favorite/state/state_manage_favorite.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/model/favorite_model.dart';
import 'package:afiyetlistesi/product/error_text.dart';
import 'package:afiyetlistesi/product/project_words.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends StateManageFavorite {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      body: Padding(
        padding: PageItemSize.pagePadding2x,
        child: ListView.builder(
          itemCount: cardItems.length,
          itemBuilder: (context, index) {
            return _BuildFavoriteCard(model: cardItems[index]);
          },
        ),
      ),
    );
  }
}

class _BuildFavoriteCard extends StatelessWidget {
  const _BuildFavoriteCard({
    required FavoriteModel model,
  }) : _model = model;

  final FavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Theme.of(context).cardTheme.shape,
      color: Theme.of(context).cardColor,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(
            PageItemSize.halfRadius(),
          ),
          child: _model.imagePath.isNotEmpty
              ? Image.network(
                  _model.imagePath,
                  height: PageItemSize.listPhotoHeightSize,
                  width: PageItemSize.listPhotoWidthSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: PageItemSize.listPhotoHeightSize,
                      width: PageItemSize.listPhotoWidthSize,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                )
              : const SizedBox(
                  height: PageItemSize.listPhotoHeightSize,
                  width: PageItemSize.listPhotoWidthSize,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
        title: Text(
          _model.title.isNotEmpty
              ? _model.title
              : ProjectErrorText.foodNotFound,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        subtitle: Text(
          ProjectWords.subtitleText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_forever_rounded,
            color: PageColors.activeButtonColor,
          ),
          onPressed: () {},
        ),
        onTap: () {},
      ),
    );
  }
}
