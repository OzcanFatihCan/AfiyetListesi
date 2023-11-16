import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/product/project_words.dart';

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
          const BackGroundWidget(),
          Positioned(
            bottom: 140,
            left: 1,
            right: 1,
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [ButtonDecoration(onPressed: () {})],
            ),
          ),
        ],
      ),
    );
  }
}

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ProjectWords.wallpapeUrl),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
