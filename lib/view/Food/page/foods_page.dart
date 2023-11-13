import 'package:flutter/material.dart';

class FoodsPageView extends StatelessWidget {
  const FoodsPageView({super.key});
  final double spaceObjects = 20;
  final String title = 'Yemek';
  final String title2 = 'Turşu';
  final String title3 = 'Reçel';
  final String title4 = 'İçecek';
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
            const Padding(
              padding: _FoodPagePaddings.pagePaddingx,
              child: FoodPageSearchBarWidget(),
            ),
            SizedBox(height: spaceObjects),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FoodPageButton(title: title, onPressed: () {}),
                  FoodPageButton(title: title2, onPressed: () {}),
                  FoodPageButton(title: title3, onPressed: () {}),
                  FoodPageButton(title: title4, onPressed: () {}),
                  FoodPageButton(title: title2, onPressed: () {}),
                  FoodPageButton(title: title3, onPressed: () {}),
                  FoodPageButton(title: title4, onPressed: () {}),
                  FoodPageButton(title: title, onPressed: () {}),
                ],
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

class FoodPageSearchBarWidget extends StatelessWidget {
  const FoodPageSearchBarWidget({
    super.key,
  });
  final String textHint = "Yemek ara";

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded),
        hintText: textHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
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
            color: _FoodPageColors.headColor,
            fontWeight: _FoodPageFont.headFont,
          ),
    );
  }
}

mixin _FoodPageColors {
  static const Color headColor = Colors.black;
  static const Color buttonColor = Colors.red;
  static const Color buttonForeColor = Colors.white;
}

mixin _FoodPagePaddings {
  static const EdgeInsets pagePaddingx = EdgeInsets.all(8.0);
  static const EdgeInsets pagePadding2x = EdgeInsets.all(16.0);
}

mixin _FoodPageFont {
  static const headFont = FontWeight.w500;
}

class FoodPageButton extends StatelessWidget
    with _FoodPageColors, _FoodPagePaddings {
  FoodPageButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: _FoodPageColors.buttonColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: _FoodPagePaddings.pagePaddingx,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: _FoodPageColors.buttonForeColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
