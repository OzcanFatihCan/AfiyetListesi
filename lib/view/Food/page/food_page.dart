import 'package:flutter/material.dart';

class FoodPageView extends StatelessWidget {
  const FoodPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: Text("Yemekler Sayfası"),
      ),
    );
  }
}
