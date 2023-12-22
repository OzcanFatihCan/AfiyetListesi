part of '../page/profile_page.dart';

class _BuildProfilPhoto extends StatefulWidget {
  const _BuildProfilPhoto({required this.state, required this.onTap});

  final MyUserState state;
  final void Function()? onTap;
  @override
  State<_BuildProfilPhoto> createState() => _BuildProfilPhotoState();
}

class _BuildProfilPhotoState extends State<_BuildProfilPhoto>
    with _pageWord, _pageSize {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.80,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          children: [
            _buildImageWidget(context, aspectValue),
            Positioned(
              top: plusIconTop,
              right: plusIconRight,
              child: _buildPlusIcon(),
            ),
          ],
        ),
      ),
    );
  }

  DottedFrame _buildImageWidget(BuildContext context, double aspectValue) {
    return DottedFrame(
      child: widget.state.user!.picture == ""
          ? Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  ItemsofAsset.profilPhotoUrl.fetchPhoto,
                ),
              ),
            )
          : Center(
              child: AspectRatio(
                aspectRatio: aspectValue,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.network(
                      widget.state.user!.picture!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildPlusIcon() {
    return Container(
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
