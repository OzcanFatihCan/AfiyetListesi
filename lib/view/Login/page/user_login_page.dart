import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/view/Login/page/user_alternative_login.dart';
import 'package:afiyetlistesi/view/Login/page/user_register_page.dart';
import 'package:afiyetlistesi/view/Home/page/home_page.dart';

import 'package:flutter/material.dart';

class UserLoginView extends StatelessWidget
    with _NavigatorManager, _pageSize, _pageWord {
  UserLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
    return Positioned(
      bottom: secondInputBarPositionBot,
      left: inputBarSymetric,
      right: inputBarSymetric,
      child: const MailTextField(),
    );
  }

  Positioned _buildPasswordInput() {
    return Positioned(
      bottom: thirdInputBarPositinBot,
      left: inputBarSymetric,
      right: inputBarSymetric,
      child: const PasswordTextField(),
    );
  }

  Positioned _buildNavigateButton(BuildContext context) {
    return Positioned(
      bottom: loginButtonPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          ButtonDecorationWidget(
            buttonTitle: loginButton,
            onPressed: () {
              navigateToWidget(context, const HomePageView());
            },
          ),
          ButtonDecorationWidget(
            buttonTitle: registerButton,
            onPressed: () {
              navigateToWidget(context, UserRegisterView());
            },
          ),
        ],
      ),
    );
  }

  Positioned _buildAlternativeLoginButton(BuildContext context) {
    return Positioned(
      bottom: alternativeLoginPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              navigateToWidget(context, const AlternativeLoginPageView());
            },
            child: Text(
              alternativeLoginButton,
              style: Theme.of(context).textTheme.titleSmall,
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

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double alternativeLoginPositionBot = 20;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double inputBarSymetric = 15;
}
mixin _pageWord {
  final alternativeLoginButton = "Alternatif Giriş";
  final loginButton = "Giriş Yap";
  final registerButton = "Kayıt Ol";
}
