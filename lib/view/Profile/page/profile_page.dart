import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/name_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/externalPackage/dotted_frame.dart';
import 'package:afiyetlistesi/product/constant/project_photo.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';

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

class _ProfilePageViewState extends StateManageProfile
    with _pageSize, _pageWord {
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
              _BuildProfilPhoto(),
              SizedBox(height: spaceObjects),
              _buildTextBody(context)
            ],
          ),
        ),
      ),
    );
  }

  Card _buildTextBody(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: AppTheme().customCardTheme().shape,
      elevation: elevationValueOff,
      child: Stack(
        children: [
          Padding(
            padding: pagePadding2x,
            child: Column(
              children: [
                Text(
                  profileTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: spaceObjects),
                NameTextField(isEditing: isEditing),
                SizedBox(height: spaceObjects),
                MailTextField(isEditing: isEditing),
                SizedBox(height: spaceObjects),
                PasswordTextField(isEditing: isEditing),
              ],
            ),
          ),
          Positioned(
            top: iconPosition,
            right: iconPosition,
            child: _buildEditButton(),
          )
        ],
      ),
    );
  }

  Row _buildEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: isEditing
              ? Icon(
                  Icons.check_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              : Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
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
  final double iconPosition = 0;
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
  //elevation
  final double elevationValueOff = 0;
}
mixin _pageWord {
  final profileTitle = "Profili Düzenle";
  final profilPhotoUrl =
      "https://image.tmdb.org/t/p/original/mbMsmQE5CyMVTIGMGCw2XpcPCOc.jpg";
}
