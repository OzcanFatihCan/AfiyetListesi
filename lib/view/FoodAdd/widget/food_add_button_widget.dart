part of '../page/food_add_page.dart';

class _BuildFoodAddButton extends StatelessWidget with _pageWord {
  _BuildFoodAddButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.100,
        width: MediaQuery.of(context).size.width,
        child: ButtonDecorationWidget(
          onPressed: () {},
          buttonTitle: buttonTitle,
        ),
      ),
    );
  }
}
