part of '../page/profile_page.dart';

class _BuildProfilPhoto extends StatelessWidget with _pageWord {
  _BuildProfilPhoto();

  @override
  Widget build(BuildContext context) {
    const double aspectValue = 1;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.80,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: DottedFrame(
          child: ClipOval(
            child: AspectRatio(
              aspectRatio: aspectValue,
              child: InkWell(
                onTap: () {},
                child: profilPhotoUrl.isNotEmpty
                    ? Image.network(
                        profilPhotoUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    : Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            backgroundImage: const AssetImage(
                              ProjectPhotos.profilPhotoUpdateUrl,
                            ),
                          ),
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
