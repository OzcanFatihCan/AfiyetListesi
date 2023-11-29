import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/name_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/externalPackage/dotted_frame.dart';

import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/Profile/state/state_manage_profile.dart';
import 'package:flutter/material.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({
    super.key,
    required this.isEditing,
  });
  //final AppBarManager appBarManager;
  final bool isEditing;
  //required this.appBarManager,
  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends StateManageProfile {
  /*
  late AppBarManager appBarManager;

  @override
  void initState() {
    super.initState();
    appBarManager = widget.appBarManager;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      body: Padding(
        padding: PageItemSize.pagePadding2x,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _BuildProfilPhoto(),
              const SizedBox(height: PageItemSize.spaceObjects),
              const Divider(
                color: Colors.red,
                endIndent: 30,
                indent: 30,
                thickness: 2,
              ),
              const SizedBox(height: PageItemSize.spaceObjects),
              NameTextField(
                isEditing: widget.isEditing, // isEditing
              ),
              const SizedBox(height: PageItemSize.spaceObjects),
              MailTextField(isEditing: widget.isEditing), //isEditing),
              const SizedBox(height: PageItemSize.spaceObjects),
              PasswordTextField(isEditing: widget.isEditing), //isEditing),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildProfilPhoto extends StatelessWidget {
  const _BuildProfilPhoto();

  @override
  Widget build(BuildContext context) {
    const double aspectValue = 1;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.80,
      child: CircleAvatar(
        backgroundColor: PageColors.deactivedButtonColor,
        child: DottedFrame(
          child: ClipOval(
            child: AspectRatio(
              aspectRatio: aspectValue,
              child: InkWell(
                onTap: () {},
                child: ProjectWords.profilPhotoUrl.isNotEmpty
                    ? Image.network(
                        ProjectWords.profilPhotoUrl,
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
                          child: const CircleAvatar(
                            backgroundColor: PageColors.deactivedButtonColor,
                            backgroundImage: AssetImage(
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
