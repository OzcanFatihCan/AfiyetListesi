import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with _pageSize {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: pagePaddingx,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Lottie.asset(
                  ItemsofAsset.lottieLoading.fetchLottie,
                ),
              ),
            ),
            Text(
              "Afiyet Listesi",
              style: AppTheme().customTextTheme().titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

mixin _pageSize {
  final EdgeInsets pagePaddingx = const EdgeInsets.all(10);
}
