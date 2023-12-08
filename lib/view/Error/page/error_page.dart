import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPageView extends StatefulWidget {
  const ErrorPageView({super.key});

  @override
  State<ErrorPageView> createState() => _ErrorPageViewState();
}

class _ErrorPageViewState extends State<ErrorPageView> with _pageItem {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
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
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Lottie.asset(
          ItemsofAsset.lottieForkSpoon.fetchLottie,
        ),
      ),
    );
  }
}

mixin _pageItem {
  //padding
  final pagePadding2x = const EdgeInsets.all(16);
}
