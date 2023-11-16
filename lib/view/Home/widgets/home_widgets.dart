import 'package:afiyetlistesi/core/card_decoration.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';

import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class HomePageContentButton extends StatefulWidget {
  const HomePageContentButton({
    super.key,
  });

  @override
  State<HomePageContentButton> createState() => _HomePageContentButtonState();
}

class _HomePageContentButtonState extends State<HomePageContentButton> {
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
          padding: PageItemSize.buttonPaddingx,
          child: HomePageButtonWidget(
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

class HomePageHeadText extends StatelessWidget with PageColors, PageFont {
  const HomePageHeadText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ProjectWords.foodHeadText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: PageColors.blackColor,
            fontWeight: PageFont.headFont,
          ),
    );
  }
}

class HomePageIntermediateText extends StatelessWidget
    with PageColors, PageFont {
  const HomePageIntermediateText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ProjectWords.foodIntermediateText,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: PageColors.blackColor,
            fontWeight: PageFont.headFont,
          ),
    );
  }
}

class HomePagePopular extends StatefulWidget {
  const HomePagePopular({
    super.key,
  });

  @override
  State<HomePagePopular> createState() => _HomePagePopularState();
}

class _HomePagePopularState extends State<HomePagePopular> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => InkWell(
          onTap: () {},
          child: const Padding(
            padding: PageItemSize.cardPaddingx,
            child: SizedBox(
              height: PageItemSize.cardHeightSize,
              width: PageItemSize.cardWidthSize,
              child: CardDecorationWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageButtonWidget extends StatelessWidget
    with PageColors, PageItemSize {
  HomePageButtonWidget({
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
            ? PageColors.activeButtonColor
            : PageColors.deactivedButtonColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: PageItemSize.pagePaddingx,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? PageColors.activeButtonForeColor
                  : PageColors.deactiveButtonForeColor,
              fontWeight: PageFont.buttonFont),
        ),
      ),
    );
  }
}
