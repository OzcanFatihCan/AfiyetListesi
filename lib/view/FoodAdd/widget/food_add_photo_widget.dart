part of '../page/food_add_page.dart';

class _BuildFoodAddPhoto extends StatefulWidget {
  const _BuildFoodAddPhoto({
    required this.onTap,
    required this.croppedFile,
  });

  final Function()? onTap;
  final CroppedFile? croppedFile;
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
          Positioned.fill(
            child: Padding(
              padding: imageFieldPadding,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: widget.croppedFile != null
                    ? Image.file(
                        File(widget.croppedFile!.path),
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        fit: BoxFit.cover,
                        ItemsofAsset.foodAdd.fetchPhoto,
                      ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.41,
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
