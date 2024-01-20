part of '../page/error_page.dart';

class _FoodErrorWidget extends StatelessWidget with _pageItem {
  _FoodErrorWidget({
    Key? key,
    required this.errorTitle,
  }) : super(key: key);

  final String errorTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: pagePaddingx,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Align(
              alignment: Alignment.center,
              child: Lottie.asset(
                ItemsofAsset.lottieFood.fetchLottie,
              ),
            ),
          ),
        ),
        Text(
          errorTitle.isNotEmpty ? errorTitle : errorTitleNotFound,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
