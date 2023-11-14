import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class FoodsPageView extends StatelessWidget {
  const FoodsPageView({super.key});

  final double spaceObjects = 20;

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
            const FoodPageSearchBarWidget(),
            SizedBox(height: spaceObjects),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FoodPageContentButton(),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.black,
      ),
    );
  }
}

class FoodPageContentButton extends StatefulWidget {
  const FoodPageContentButton({
    super.key,
  });

  @override
  State<FoodPageContentButton> createState() => _FoodPageContentButtonState();
}

class _FoodPageContentButtonState extends State<FoodPageContentButton> {
  late int selectedButtonIndex;

  @override
  void initState() {
    super.initState();
    selectedButtonIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> buttonTitles = [
      'Yemekler',
      'Tatlılar',
      'Turşular',
      'Reçeller',
      'İçecekler',
    ];
    return Row(
      children: List.generate(5, (index) {
        return Padding(
          padding: _FoodPagePaddings.buttonPaddingx,
          child: FoodPageButton(
            //buton isimleri yemek, turşu, içecek, reçel, tatlı,
            title: buttonTitles[index],
            onPressed: () {
              setState(() {
                selectedButtonIndex = index;
              });
            },
            isSelected: selectedButtonIndex == index,
          ),
        );
      }),
    );
  }
}

class FoodPageSearchBarWidget extends StatelessWidget {
  const FoodPageSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_rounded),
          hintText: ProjectWords.searchHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

class FoodPageHeadText extends StatelessWidget
    with _FoodPageColors, _FoodPageFont {
  const FoodPageHeadText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ProjectWords.headText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: _FoodPageColors.headColor,
            fontWeight: _FoodPageFont.headFont,
          ),
    );
  }
}

mixin _FoodPageColors {
  static const Color headColor = Colors.black;
  static const Color activeButtonColor = Colors.red;
  static const Color deactivedButtonColor = Colors.transparent;
  static const Color activeButtonForeColor = Colors.white;
  static const Color deactiveButtonForeColor = Colors.grey;
}

mixin _FoodPagePaddings {
  static const EdgeInsets pagePaddingx = EdgeInsets.all(8.0);
  static const EdgeInsets pagePadding2x = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPaddingx = EdgeInsets.symmetric(horizontal: 15);
}

mixin _FoodPageFont {
  static const headFont = FontWeight.w500;
  static const buttonFont = FontWeight.bold;
}

class FoodPageButton extends StatelessWidget
    with _FoodPageColors, _FoodPagePaddings {
  FoodPageButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isSelected = true,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: _FoodPageColors.headColor),
        shape: const StadiumBorder(),
        elevation: 0,
        backgroundColor: isSelected
            ? _FoodPageColors.activeButtonColor
            : _FoodPageColors.deactivedButtonColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: _FoodPagePaddings.pagePaddingx,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? _FoodPageColors.activeButtonForeColor
                  : _FoodPageColors.deactiveButtonForeColor,
              fontWeight: _FoodPageFont.buttonFont),
        ),
      ),
    );
  }
}
