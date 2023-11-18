import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/project_words.dart';

import 'package:flutter/material.dart';

class UserLoginView extends StatelessWidget {
  const UserLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PageColors.deactivedScafooldColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackGroundWidget(
            wallpaperUrl: ProjectWords.loginWallpapeUrl,
          ),
          //button ve input girişleri yapılacak.
        ],
      ),
    );
  }
}
