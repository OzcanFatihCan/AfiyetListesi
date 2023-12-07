import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/constant/project_photo.dart';
import 'package:afiyetlistesi/view/Loading/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:afiyetlistesi/view/Login/viewModel/state_manage_login.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends StateManageLogin
    with _pageSize, _pageWord, _pageDuration {
  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingPageView()
      : Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Stack(
            fit: StackFit.expand,
            children: [
              BackGroundWidget(
                wallpaperUrl: ItemsofAsset.wallpaperUrl.fetchPhoto,
              ),
              _buildLoginButtoWidget(
                context,
              )
            ],
          ),
        );

  Positioned _buildLoginButtoWidget(
    BuildContext context,
  ) {
    return Positioned(
      bottom: loginButtonPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.35,
          child: ButtonDecorationWidget(
            buttonTitle: loginButton,
            onPressed: () async {
              changeLoading();
              await Future.delayed(Duration(seconds: duration));
              await NavigatorManager.instance.pushToPage(NavigateRoutes.login);
              changeLoading();
            },
          ),
        ),
      ),
    );
  }
}

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
}

mixin _pageWord {
  final loginButton = "Giriş";
}

mixin _pageDuration {
  final int duration = 1;
}
