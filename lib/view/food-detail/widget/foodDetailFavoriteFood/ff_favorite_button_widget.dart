part of '../../page/food_detail_page.dart';

class _BuildFavoriteFoodFavoriteButton extends StatelessWidget with _pageWord {
  _BuildFavoriteFoodFavoriteButton({
    required Function() onPressed,
  }) : _onPressed = onPressed;

  final Function() _onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ButtonDecorationWidget(
            onPressed: _onPressed,
            buttonTitle: buttonTitle2,
          ),
        ),
      ),
    );
  }
}
