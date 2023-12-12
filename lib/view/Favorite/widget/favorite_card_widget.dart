part of '../page/favorite_page.dart';

class _BuildFavoriteCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildFavoriteCard({
    required FavoriteModell model,
  }) : _model = model;

  final FavoriteModell _model;

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
          _model.title.isNotEmpty ? _model.title : foodNotFound,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        subtitle: Text(
          subtitleText,
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
