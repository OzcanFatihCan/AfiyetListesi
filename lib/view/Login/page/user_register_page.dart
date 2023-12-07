import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/name_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:flutter/material.dart';

class UserRegisterView extends StatelessWidget
    with _pageSize, _pageWord, _pageDuration {
  UserRegisterView({super.key});

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
          _buildNameInput(),
          _buildMailInput(),
          _buildPasswordInput(),
          _buildNavigateButton(context),
        ],
      ),
    );
  }

  Positioned _buildNameInput() {
    return Positioned(
      bottom: firstInputBarPositionBot,
      left: inputBarSymetric,
      right: inputBarSymetric,
      child: const NameTextField(),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.35,
            child: ButtonDecorationWidget(
              buttonTitle: registerButton,
              onPressed: () async {
                await Future.delayed(Duration(seconds: duration));
                () async {
                  await NavigatorManager.instance
                      .pushToPage(NavigateRoutes.home);
                }();
              },
            ),
          ),
        ],
      ),
    );
  }
}

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double firstInputBarPositionBot = 430;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double inputBarSymetric = 15;
}
mixin _pageWord {
  final registerButton = "Kayıt Ol";
}

mixin _pageDuration {
  final int duration = 1;
}
