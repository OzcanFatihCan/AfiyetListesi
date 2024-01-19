import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FoodErrorPage extends StatelessWidget {
  const FoodErrorPage({
    super.key,
    required this.pagePaddingx,
    required this.errorTitle,
  });

  final EdgeInsets pagePaddingx;
  final String errorTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: pagePaddingx,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Align(
              alignment: Alignment.center,
              child: Lottie.asset(
                ItemsofAsset.lottieLoading2.fetchLottie,
              ),
            ),
          ),
        ),
        Text(
          errorTitle,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
