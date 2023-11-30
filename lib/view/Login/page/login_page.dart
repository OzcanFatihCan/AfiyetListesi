import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/view/Login/page/user_login_page.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget with _pageSize, _pageWord {
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackGroundWidget(
            wallpaperUrl: ProjectPhotos.wallpapeUrl,
          ),
          _buildLoginButtoWidget(
            context,
          )
        ],
      ),
    );
  }

  Positioned _buildLoginButtoWidget(
    BuildContext context,
  ) {
    return Positioned(
      bottom: loginButtonPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: Container(
        alignment: Alignment.center,
        child: ButtonDecorationWidget(
          buttonTitle: loginButton,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserLoginView(),
              ),
            );
          },
        ),
      ),
    );
  }
}

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
}

mixin _pageWord {
  final loginButton = "Giriş Yap";
}
