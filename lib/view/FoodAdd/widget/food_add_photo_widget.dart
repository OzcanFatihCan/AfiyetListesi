part of '../page/food_add_page.dart';

class _BuildFoodAddPhoto extends StatefulWidget {
  const _BuildFoodAddPhoto({required this.onTap});

  final Function()? onTap;
  @override
  State<_BuildFoodAddPhoto> createState() => __BuildFoodAddPhotoState();
}

class __BuildFoodAddPhotoState extends State<_BuildFoodAddPhoto>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Padding(
            padding: imageFieldPadding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                fit: BoxFit.cover,
                ItemsofAsset.foodAdd.fetchPhoto,
              ),
            ),
          ),
          Positioned(
            top: 182,
            left: 160,
            child: _buildPlusIcon(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlusIcon() {
    return Container(
      padding: iconPadding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
