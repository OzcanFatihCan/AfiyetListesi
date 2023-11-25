import 'package:afiyetlistesi/view/FoodDetail/page/food_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/inputbar_widget.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';
import 'package:afiyetlistesi/product/error_text.dart';

class PopularPageView extends StatelessWidget {
  const PopularPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PageColors.mainPageColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: PageItemSize.pagePadding2x,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeadTextWidget(context),
              const SizedBox(height: PageItemSize.spaceObjects),
              const InputBarWidget(
                hint: ProjectWords.searchHint,
                icon: Icons.search_rounded,
              ),
              const SizedBox(height: PageItemSize.spaceObjects),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _BuildContentButton(),
              ),
              const SizedBox(height: PageItemSize.spaceObjectsMin),
              _buildMiddleTextWidget(context),
              const SizedBox(height: PageItemSize.spaceObjects),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: _BuildPopularWidget(),
              ),
              const SizedBox(height: PageItemSize.spaceObjectsMin),
            ],
          ),
        ),
      ),
    );
  }
}

FittedBox _buildHeadTextWidget(BuildContext context) {
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

class _BuildContentButton extends StatefulWidget {
  const _BuildContentButton();

  @override
  State<_BuildContentButton> createState() => _BuildContentButtonState();
}

class _BuildContentButtonState extends State<_BuildContentButton> {
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
          child: _ButtonWidget(
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

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
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

Row _buildMiddleTextWidget(BuildContext context) {
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

class _BuildPopularWidget extends StatefulWidget {
  const _BuildPopularWidget();

  @override
  State<_BuildPopularWidget> createState() => _BuildPopularWidgetState();
}

//popülerleri dışarıdan çekerken kontrol edilecek.
class _BuildPopularWidgetState extends State<_BuildPopularWidget> {
  late List<PopularFavoriteModel> _cardItems;
  @override
  void initState() {
    super.initState();
    _cardItems = PopularFavoriteItems().cardItems;
  }

  //örnek popülerden çekilen loading + veri işlemi burada yapılacak.

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
            return _BuildPopularCard(model: _cardItems[index]);
          },
        ),
      ),
    );
  }
}

class _BuildPopularCard extends StatelessWidget {
  const _BuildPopularCard({
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.48,
      child: InkWell(
        onTap: () {
          _gotoDetailsPage(context, FoodDetailPage(model: _model));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              PageItemSize.halfRadius(),
            ),
          ),
          color: PageColors.cardColor,
          child: Column(
            children: <Widget>[
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

void _gotoDetailsPage(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (BuildContext context) => widget),
  );
}

class PopularFavoriteItems {
  late List<PopularFavoriteModel> cardItems;
  PopularFavoriteItems() {
    cardItems = [
      PopularFavoriteModel(
        id: 1,
        imagePath: ProjectWords.photoUrl,
        title: "Bulgur Pilavı",
        category: 1,
        materialsFood: ProjectWords.materialsFood,
        recipe: ProjectWords.cookingRecipe,
      ),
      PopularFavoriteModel(
          id: 2,
          imagePath: ProjectWords.photoUrl2,
          title: "Sütlaç",
          category: 2),
      PopularFavoriteModel(
          id: 3,
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      PopularFavoriteModel(
          id: 4,
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      PopularFavoriteModel(
          id: 5,
          imagePath: ProjectWords.photoUrl2,
          title: "Sütlaç",
          category: 2),
      PopularFavoriteModel(
          id: 6,
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
    ];
  }
}
