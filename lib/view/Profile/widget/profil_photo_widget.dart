part of '../page/profile_page.dart';

class _BuildProfilPhoto extends StatefulWidget {
  const _BuildProfilPhoto({required this.state});

  final MyUserState state;

  @override
  State<_BuildProfilPhoto> createState() => _BuildProfilPhotoState();
}

class _BuildProfilPhotoState extends State<_BuildProfilPhoto> with _pageWord {
  @override
  Widget build(BuildContext context) {
    var toolbarColor = Theme.of(context).colorScheme.background;
    var toolbarWidthColor = Theme.of(context).colorScheme.primary;
    const double aspectValue = 1;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.80,
      child: GestureDetector(
        onTap: () async {
          final ImagePicker picker = ImagePicker();
          final XFile? image = await picker.pickImage(
              source: ImageSource.gallery,
              maxHeight: 500,
              maxWidth: 500,
              imageQuality: 40);
          if (image != null) {
            CroppedFile? croppedFile = await ImageCropper().cropImage(
              sourcePath: image.path,
              aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
              aspectRatioPresets: [CropAspectRatioPreset.square],
              uiSettings: [
                AndroidUiSettings(
                    toolbarTitle: cropperName,
                    toolbarColor: toolbarColor,
                    toolbarWidgetColor: toolbarWidthColor,
                    initAspectRatio: CropAspectRatioPreset.original,
                    lockAspectRatio: false),
                IOSUiSettings(
                  title: cropperName,
                ),
              ],
            );
            if (croppedFile != null) {
              setState(() {
                context.read<UpdateUserInfoBloc>().add(
                      UploadPicture(croppedFile.path,
                          context.read<MyUserBloc>().state.user!.id),
                    );
              });
            }
          }
        },
        child: DottedFrame(
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
        ),
      ),
    );
  }
}
