part of '../page/error_page.dart';

class _PageErrorWidget extends StatelessWidget with _pageItem {
  _PageErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding2x,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Lottie.asset(
                ItemsofAsset.lottieError.fetchLottie,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
