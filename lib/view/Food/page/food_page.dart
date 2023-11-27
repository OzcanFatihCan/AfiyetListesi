import 'package:afiyetlistesi/core/color_set.dart';
import 'package:flutter/material.dart';

class FoodPageView extends StatelessWidget {
  const FoodPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PageColors.mainPageColor,
      body: Center(
        child: Text("Yemekler Sayfası"),
      ),
    );
  }
}
