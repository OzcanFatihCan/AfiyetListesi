import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/project_photo.dart';
import 'package:afiyetlistesi/view/Login/widgets/login_widgets.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PageColors.deactivedScafooldColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackGroundWidget(
            wallpaperUrl: ProjectPhotos.wallpapeUrl,
          ),
          LoginButtonWidget(),
        ],
      ),
    );
  }
}
