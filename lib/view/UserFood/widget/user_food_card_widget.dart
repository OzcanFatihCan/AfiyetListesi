// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../page/user_food_page.dart';

class _BuildUserFoodCard extends StatelessWidget with _pageSize, _pageWord {
  _BuildUserFoodCard({
    required Post model,
  }) : _model = model;

  final Post _model;

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
          onPressed: () {},
        ),
        onTap: () async {
          await NavigatorManager.instance
              .pushToPage(NavigateRoutes.foodDetail, arguments: {
            'model': _model,
            'pageType': FoodDetailManager.instance.getDetailType(
              FoodDetailType.userfood,
            ),
          });
        },
      ),
    );
  }
}
