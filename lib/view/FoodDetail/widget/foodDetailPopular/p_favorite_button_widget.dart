part of '../../page/food_detail_page.dart';

class _BuildFavoriteButton extends StatelessWidget with _pageWord {
  _BuildFavoriteButton();

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
            buttonTitle: buttonTitle,
          ),
        ),
      ),
    );
  }
}
