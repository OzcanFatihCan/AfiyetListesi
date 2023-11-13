import 'package:flutter/material.dart';

class FoodsPageView extends StatelessWidget {
  const FoodsPageView({super.key});
  final double spaceObjects = 25;
  final String textHint = "Yemek ara";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: _FoodPagePaddings.pagePadding2x,
        child: Column(
          children: [
            const FoodPageHeadText(),
            SizedBox(height: spaceObjects),
            Padding(
              padding: _FoodPagePaddings.pagePaddingx,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded),
                  hintText: textHint,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.black,
      ),
    );
  }
}

class FoodPageHeadText extends StatelessWidget
    with _FoodPageColors, _FoodPageFont {
  const FoodPageHeadText({super.key});
  final String headText = "Hamidenin Lezzet Listesi";

  @override
  Widget build(BuildContext context) {
    return Text(
      headText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: _FoodPageColors.headColor, fontWeight: _FoodPageFont.headFont),
    );
  }
}

mixin _FoodPageColors {
  static const Color headColor = Colors.black;
}

class _FoodPagePaddings {
  static const pagePaddingx = EdgeInsets.all(8.0);
  static const pagePadding2x = EdgeInsets.all(16.0);
}

mixin _FoodPageFont {
  static const headFont = FontWeight.w500;
}
