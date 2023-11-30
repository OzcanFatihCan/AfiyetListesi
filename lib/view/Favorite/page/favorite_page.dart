import 'package:afiyetlistesi/view/Favorite/state/state_manage_favorite.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/model/favorite_model.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends StateManageFavorite with _pageSize {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: pagePadding2x,
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

class _BuildFavoriteCard extends StatelessWidget with _pageSize {
  _BuildFavoriteCard({
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
            halfRadius,
          ),
          child: _model.imagePath.isNotEmpty
              ? Image.network(
                  _model.imagePath,
                  height: listPhotoHeightSize,
                  width: listPhotoWidthSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: listPhotoHeightSize,
                      width: listPhotoWidthSize,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                )
              : SizedBox(
                  height: listPhotoHeightSize,
                  width: listPhotoWidthSize,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
        title: Text(
          _model.title.isNotEmpty ? _model.title : _pageWord.foodNotFound,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        subtitle: Text(
          _pageWord.subtitleText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete_forever_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {},
        ),
        onTap: () {},
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double listPhotoHeightSize = 60;
  final double listPhotoWidthSize = 80;
  //radius
  final halfRadius = const Radius.circular(15);
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
}

mixin _pageWord {
  static String subtitleText = "Tarif için tıkla";
  static const foodNotFound = "Yemek adı yükleniyor...";
}
