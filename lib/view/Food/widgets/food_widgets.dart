import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/card_decoration.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/text_field_decoration.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

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
          padding: PageItemSize.buttonPaddingx,
          child: ButtonDecorationWidget(
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
    return SizedBox(
      height: PageItemSize.textFieldSize,
      child: TextField(
        decoration: privTextFieldDecoration(),
      ),
    );
  }
}

class FoodPageHeadText extends StatelessWidget with PageColors, FoodPageFont {
  const FoodPageHeadText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ProjectWords.foodHeadText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: PageColors.blackColor,
            fontWeight: FoodPageFont.headFont,
          ),
    );
  }
}

class FoodPageIntermediateText extends StatelessWidget
    with PageColors, FoodPageFont {
  const FoodPageIntermediateText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ProjectWords.foodIntermediateText,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: PageColors.blackColor,
            fontWeight: FoodPageFont.headFont,
          ),
    );
  }
}

class FoodPagePopular extends StatefulWidget {
  const FoodPagePopular({
    super.key,
  });

  @override
  State<FoodPagePopular> createState() => _FoodPagePopularState();
}

class _FoodPagePopularState extends State<FoodPagePopular> {
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
