import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/inputbar_widget.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/Login/page/user_alternative_login.dart';
import 'package:afiyetlistesi/view/Login/page/user_register_page.dart';
import 'package:afiyetlistesi/view/PageControl/page/control_page.dart';

import 'package:flutter/material.dart';

class UserLoginView extends StatelessWidget with _NavigatorManager {
  const UserLoginView({super.key});

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
          _buildMailInput(),
          _buildPasswordInput(),
          _buildNavigateButton(context),
          _buildAlternativeLoginButton(context),
        ],
      ),
    );
  }

  Positioned _buildMailInput() {
    return const Positioned(
      bottom: PageItemSize.secondInputBarPositionBot,
      left: PageItemSize.inputBarSymetric,
      right: PageItemSize.inputBarSymetric,
      child: MailTextField(),
    );
  }

  Positioned _buildPasswordInput() {
    return const Positioned(
      bottom: PageItemSize.thirdInputBarPositinBot,
      left: PageItemSize.inputBarSymetric,
      right: PageItemSize.inputBarSymetric,
      child: PasswordTextField(),
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
            buttonTitle: ProjectWords.loginButton,
            onPressed: () {
              navigateToWidget(context, const PageControlView());
            },
          ),
          ButtonDecorationWidget(
            buttonTitle: ProjectWords.registerButton,
            onPressed: () {
              navigateToWidget(context, const UserRegisterView());
            },
          ),
        ],
      ),
    );
  }

  Positioned _buildAlternativeLoginButton(BuildContext context) {
    return Positioned(
      bottom: PageItemSize.alternativeLoginPositionBot,
      left: PageItemSize.loginButtonSymetric,
      right: PageItemSize.loginButtonSymetric,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              navigateToWidget(context, const AlternativeLoginPageView());
            },
            child: Text(
              ProjectWords.alternativeLoginButton,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: PageColors.blackColor,
                    fontWeight: PageFont.textFont,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin _NavigatorManager {
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
