import 'package:afiyetlistesi/core/color_set.dart';
import 'package:flutter/material.dart';

class FavoritePageView extends StatelessWidget {
  const FavoritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      body: Center(
        child: Text("Favori Sayfası"),
      ),
    );
  }
}
