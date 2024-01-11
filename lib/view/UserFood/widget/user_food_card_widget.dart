part of '../page/user_food_page.dart';

// ignore: must_be_immutable
class _BuildUserFoodCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildUserFoodCard({
    required Post model,
    required void Function()? itemDeleteOnPressed,
    required void Function()? itemDetailOnTap,
  })  : _model = model,
        _itemDeleteOnPressed = itemDeleteOnPressed,
        _itemDetailOnTap = itemDetailOnTap;

  final Post _model;
  final Function()? _itemDeleteOnPressed;
  final Function()? _itemDetailOnTap;

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
          child: _model.foodPhoto.isNotEmpty
              ? Image.network(
                  _model.foodPhoto,
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
          _model.foodName.isNotEmpty ? _model.foodName : foodNotFound,
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
        onTap: _itemDetailOnTap,
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
