part of '../page/favorite_page.dart';

class _BuildFavoriteCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildFavoriteCard({
    required FavoriteModel model,
    required Function()? itemDeleteOnPressed,
  })  : _model = model,
        _itemDeleteOnPressed = itemDeleteOnPressed;

  final FavoriteModel _model;
  final Function()? _itemDeleteOnPressed;

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
          child: _model.favorite.foodPhoto.isNotEmpty
              ? Image.network(
                  _model.favorite.foodPhoto,
                  height: listPhotoHeightSize,
                  width: listPhotoWidthSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: listPhotoHeightSize,
                      width: listPhotoWidthSize,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    );
                  },
                )
              : SizedBox(
                  height: listPhotoHeightSize,
                  width: listPhotoWidthSize,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
        ),
        title: Text(
          _model.favorite.foodName.isNotEmpty
              ? _model.favorite.foodName
              : foodNotFound,
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
          onPressed: () {
            _showDeleteConfirmationDialog(context);
          },
        ),
        onTap: () {},
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            deleteFoodTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          content: Text(
            deleteFood,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(cancelButton),
            ),
            TextButton(
              onPressed: _itemDeleteOnPressed,
              child: Text(okButton),
            ),
          ],
        );
      },
    );
  }
}
