import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/name_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/externalPackage/dotted_frame.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class PersonPageView extends StatefulWidget {
  final bool isEditing;
  const PersonPageView({super.key, required this.isEditing});

  @override
  State<PersonPageView> createState() => _PersonPageViewState();
}

class _PersonPageViewState extends State<PersonPageView> {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.80,
                child: CircleAvatar(
                  backgroundColor: PageColors.deactivedButtonColor,
                  child: DottedFrame(
                    child: ClipOval(
                      child: AspectRatio(
                        aspectRatio: 1,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    child: const CircleAvatar(
                                      backgroundColor:
                                          PageColors.deactivedButtonColor,
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
              ),
              const SizedBox(height: PageItemSize.spaceObjects),
              const Divider(
                color: Colors.red,
                endIndent: 30,
                indent: 30,
                thickness: 2,
              ),
              const SizedBox(height: PageItemSize.spaceObjects),
              NameTextField(
                isEditing: widget.isEditing,
              ),
              const SizedBox(height: PageItemSize.spaceObjects),
              MailTextField(isEditing: widget.isEditing),
              const SizedBox(height: PageItemSize.spaceObjects),
              PasswordTextField(isEditing: widget.isEditing),
            ],
          ),
        ),
      ),
    );
  }
}
