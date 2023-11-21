import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';
import 'package:afiyetlistesi/product/error_text.dart';

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

//popülerleri dışarıdan çekerken kontrol edilecek.
class _HomePagePopularState extends State<HomePagePopular> {
  late List<PopularFavoriteModel> _cardItems;
  @override
  void initState() {
    super.initState();
    _cardItems = PopularFavoriteItems().cardItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageItemSize.listPaddingx,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.39,
        width: MediaQuery.of(context).size.width * 0.86,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _cardItems.length,
          itemBuilder: (context, index) {
            return BuildPopularCard(model: _cardItems[index]);
          },
        ),
      ),
    );
  }
}

class BuildPopularCard extends StatelessWidget {
  const BuildPopularCard({
    super.key,
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.48,
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              PageItemSize.halfRadius(),
            ),
          ),
          color: PageColors.cardColor,
          child: Column(
            children: [
              Padding(
                padding: PageItemSize.imagePadding,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(PageItemSize.halfRadius()),
                  child: _model.imagePath.isNotEmpty
                      ? Image.network(
                          _model.imagePath,
                          height: PageItemSize.foodPhotoHeightSize,
                          width: PageItemSize.foodPhotoWidthSize,
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: PageItemSize.foodPhotoWidthSize,
                              height: PageItemSize.foodPhotoHeightSize,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        )
                      : const SizedBox(
                          height: PageItemSize.foodPhotoHeightSize,
                          width: PageItemSize.foodPhotoWidthSize,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: PageItemSize.spaceObjects,
              ),
              Padding(
                padding: PageItemSize.objectPadding2x,
                child: Text(
                  softWrap: true,
                  _model.title.isNotEmpty
                      ? _model.title
                      : ProjectErrorText.foodNotFound,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: PageColors.blackColor,
                        fontWeight: PageFont.textFont,
                      ),
                ),
              ),
              Padding(
                padding: PageItemSize.objectPadding2x,
                child: Text(
                  ProjectWords.subtitleText,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: PageColors.blackColor,
                      fontWeight: PageFont.subtitleFont),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularFavoriteItems {
  late List<PopularFavoriteModel> cardItems;
  PopularFavoriteItems() {
    cardItems = [
      PopularFavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      PopularFavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      PopularFavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      PopularFavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      PopularFavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      PopularFavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
    ];
  }
}



/*
Padding(
            padding: PageItemSize.cardPaddingx,
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.37, //PageItemSize.cardHeightSize,
              width: MediaQuery.of(context).size.width *
                  0.48, //PageItemSize.cardWidthSize,
              child: const CardDecorationWidget(),
            ),
          ),
 */