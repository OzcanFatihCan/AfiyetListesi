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
    return Row(
      //kategoriler internetten çekildiğinde düzenlenecek.
      children: List.generate(ProjectWords.contentButtonTitles.length, (index) {
        return Padding(
          padding: PageItemSize.buttonPaddingx,
          child: HomePageButtonWidget(
            //buton isimleri yemek, turşu, içecek, reçel, tatlı,
            title: ProjectWords.contentButtonTitles[index],
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
        elevation: PageItemSize.elevationValueOff,
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

class HomePageHeadText extends StatelessWidget with PageColors, PageFont {
  const HomePageHeadText({super.key});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        softWrap: true,
        ProjectWords.foodHeadText,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: PageColors.blackColor,
              fontWeight: PageFont.headFont,
            ),
      ),
    );
  }
}

class HomePageMiddleWidget extends StatelessWidget with PageColors, PageFont {
  const HomePageMiddleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ProjectWords.foodIntermediateText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: PageColors.blackColor,
                fontWeight: PageFont.headFont,
              ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            ProjectWords.allFood,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: PageColors.activeButtonColor,
                  fontWeight: PageFont.headFont,
                ),
          ),
        )
      ],
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
          child: Padding(
            padding: PageItemSize.cardPaddingx,
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.37, //PageItemSize.cardHeightSize,
              width: MediaQuery.of(context).size.width *
                  0.48, //PageItemSize.cardWidthSize,
              child: const CardDecorationWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
