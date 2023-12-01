import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/name_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/externalPackage/dotted_frame.dart';
import 'package:afiyetlistesi/product/project_photo.dart';

import 'package:afiyetlistesi/view/Profile/state/state_manage_profile.dart';
import 'package:flutter/material.dart';

part '../widget/profil_photo_widget.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({
    super.key,
  });

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends StateManageProfile with _pageSize {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: pagePadding2x,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildEditButton(),
              _BuildProfilPhoto(),
              SizedBox(height: spaceObjects),
              Divider(
                color: Theme.of(context).colorScheme.onPrimary,
                endIndent: indent,
                indent: indent,
                thickness: thickness,
              ),
              SizedBox(height: spaceObjects),
              NameTextField(
                isEditing: isEditing,
              ),
              SizedBox(height: spaceObjects),
              MailTextField(isEditing: isEditing),
              SizedBox(height: spaceObjects),
              PasswordTextField(isEditing: isEditing),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: isEditing
              ? const Icon(Icons.check_rounded)
              : const Icon(Icons.edit_rounded),
          onPressed: () {
            changeEditing();
          },
        ),
      ],
    );
  }
}

mixin _pageSize {
  //obj
  final double spaceObjects = 20;
  final double indent = 30;
  final double thickness = 2;
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
}
mixin _pageWord {
  final profilPhotoUrl =
      "https://image.tmdb.org/t/p/original/mbMsmQE5CyMVTIGMGCw2XpcPCOc.jpg";
}
