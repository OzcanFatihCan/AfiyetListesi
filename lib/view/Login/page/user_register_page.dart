import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/inputbar_widget.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/PageControl/page/control_page.dart';
import 'package:flutter/material.dart';

class UserRegisterView extends StatelessWidget with NavigatorManager {
  const UserRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.deactivedScafooldColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackGroundWidget(
            wallpaperUrl: ProjectPhotos.loginWallpapeUrl,
          ),
          _buildNameInput(),
          _buildMailInput(),
          _buildPasswordInput(),
          _buildNavigateButton(context),
        ],
      ),
    );
  }

  Positioned _buildNameInput() {
    return const Positioned(
      bottom: PageItemSize.firstInputBarPositionBot,
      left: PageItemSize.inputBarSymetric,
      right: PageItemSize.inputBarSymetric,
      child: InputBarWidget(
        hint: ProjectWords.profilHint,
        icon: Icons.person,
        keyboardType: TextInputType.text,
        fillColor: PageColors.textFieldContentOnColor,
      ),
    );
  }

  Positioned _buildMailInput() {
    return const Positioned(
      bottom: PageItemSize.secondInputBarPositionBot,
      left: PageItemSize.inputBarSymetric,
      right: PageItemSize.inputBarSymetric,
      child: InputBarWidget(
        hint: ProjectWords.mailHint,
        icon: Icons.mail_rounded,
        keyboardType: TextInputType.emailAddress,
        fillColor: PageColors.textFieldContentOnColor,
      ),
    );
  }

  Positioned _buildPasswordInput() {
    return const Positioned(
      bottom: PageItemSize.thirdInputBarPositinBot,
      left: PageItemSize.inputBarSymetric,
      right: PageItemSize.inputBarSymetric,
      child: InputBarWidget(
        hint: ProjectWords.passwordHint,
        icon: Icons.password_rounded,
        keyboardType: TextInputType.visiblePassword,
        fillColor: PageColors.textFieldContentOnColor,
        isPasw: true,
      ),
    );
  }

  Positioned _buildNavigateButton(BuildContext context) {
    return Positioned(
      bottom: PageItemSize.loginButtonPositionBot,
      left: PageItemSize.loginButtonSymetric,
      right: PageItemSize.loginButtonSymetric,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          ButtonDecorationWidget(
            buttonTitle: ProjectWords.registerButton,
            onPressed: () {
              navigateToWidget(context, const PageControlView());
            },
          ),
        ],
      ),
    );
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true,
      ),
    );
  }
}
