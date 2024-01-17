part of '../../page/food_detail_page.dart';

class _BuildFavoriteFoodFavoriteButton extends StatefulWidget with _pageWord {
  _BuildFavoriteFoodFavoriteButton();

  @override
  State<_BuildFavoriteFoodFavoriteButton> createState() =>
      _BuildFavoriteFoodFavoriteButtonState();
}

class _BuildFavoriteFoodFavoriteButtonState
    extends State<_BuildFavoriteFoodFavoriteButton> with _pageWord {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ButtonDecorationWidget(
            onPressed: () {},
            buttonTitle: buttonTitle2,
          ),
        ),
      ),
    );
  }
}
