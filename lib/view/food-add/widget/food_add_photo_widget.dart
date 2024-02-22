part of '../page/food_add_page.dart';

class _BuildFoodAddPhoto extends StatefulWidget {
  const _BuildFoodAddPhoto({
    required this.onTap,
    required this.foodPhotoPick,
  });

  final Function()? onTap;
  final File? foodPhotoPick;
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
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            bottom: fotoHeight / 2.5,
            child: Padding(
              padding: imageFieldPadding,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: widget.foodPhotoPick != null
                    ? Image.file(
                        File(widget.foodPhotoPick!.path),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        fit: BoxFit.cover,
                        ItemsofAsset.foodAdd.fetchPhoto,
                      ),
              ),
            ),
          ),
          Positioned(
            height: fotoHeight,
            bottom: fotoBottom,
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
