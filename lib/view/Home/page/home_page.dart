import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.deactivedScafooldColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackGroundWidget(),
          Positioned(
            bottom: 140, // Yüksekliği ayarlayabilirsiniz
            left: 1,
            right: 1,
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Butona tıklanınca yapılacak işlemler
                  },
                  child: Text('Giriş Yap'),
                ),
              ],
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
