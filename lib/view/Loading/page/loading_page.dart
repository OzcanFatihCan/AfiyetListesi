import 'package:afiyetlistesi/externalPackage/text/text_animation.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPageView extends StatefulWidget {
  const LoadingPageView({super.key});

  @override
  State<LoadingPageView> createState() => _LoadingPageViewState();
}

class _LoadingPageViewState extends State<LoadingPageView> with _pageItem {
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Lottie.asset(
                  ItemsofAsset.lottieFood.fetchLottie,
                ),
              ),
              Lottie.asset(
                ItemsofAsset.lottieLoading.fetchLottie,
              ),
              TextAnimated(text: appName),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
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

  //words
  final appName = "Afiyet Listesi";
}
