import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/view/Login/page/user_login_page.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.deactivedScafooldColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackGroundWidget(
            wallpaperUrl: ProjectPhotos.wallpapeUrl,
          ),
          _buildLoginButtoWidget(context)
        ],
      ),
    );
  }
}

Positioned _buildLoginButtoWidget(BuildContext context) {
  return Positioned(
    bottom: PageItemSize.loginButtonPositionBot,
    left: PageItemSize.loginButtonSymetric,
    right: PageItemSize.loginButtonSymetric,
    child: Container(
      alignment: Alignment.center,
      child: ButtonDecorationWidget(
        buttonTitle: ProjectWords.loginButton,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserLoginView(),
            ),
          );
        },
      ),
    ),
  );
}
