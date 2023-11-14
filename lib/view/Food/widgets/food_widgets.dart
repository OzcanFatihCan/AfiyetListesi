import 'package:afiyetlistesi/core/color_set.dart';
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

class FoodPageButton extends StatelessWidget with PageColors, PageItemSize {
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
              fontWeight: FoodPageFont.buttonFont),
        ),
      ),
    );
  }
}

mixin FoodPageFont {
  static const headFont = FontWeight.w500;
  static const buttonFont = FontWeight.bold;
}
