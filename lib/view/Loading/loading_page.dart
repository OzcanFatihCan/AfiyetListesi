import 'package:afiyetlistesi/product/constant/project_photo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPageView extends StatefulWidget {
  const LoadingPageView({super.key});

  @override
  State<LoadingPageView> createState() => _LoadingPageViewState();
}

class _LoadingPageViewState extends State<LoadingPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Lottie.asset(ItemsofAsset.lottieLoading.fetchLottie),
      ),
    );
  }
}
