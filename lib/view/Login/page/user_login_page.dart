import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/mail_text_field.dart';
import 'package:afiyetlistesi/product/components/text/password_text_field.dart';
import 'package:afiyetlistesi/product/components/image/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/view/Loading/page/loading_page.dart';
import 'package:afiyetlistesi/view/Login/viewModel/state_manage_user_login.dart';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class UserLoginView extends StatefulWidget {
  const UserLoginView({super.key});

  @override
  State<UserLoginView> createState() => _UserLoginViewState();
}

class _UserLoginViewState extends StateManageUserLogin
    with _pageSize, _pageWord, _pageDuration {
  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingPageView()
      : Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          resizeToAvoidBottomInset: false,
          body: Stack(
            fit: StackFit.expand,
            children: [
              BackGroundWidget(
                wallpaperUrl: ItemsofAsset.loginWallpaperUrl.fetchPhoto,
              ),
              _buildMailInput(),
              _buildPasswordInput(),
              _buildNavigateButton(context),
              _buildAlternativeLoginButton(context),
            ],
          ),
        );
  Positioned _buildMailInput() {
    return Positioned(
      bottom: secondInputBarPositionBot,
      left: inputBarSymetric,
      right: inputBarSymetric,
      child: const MailTextField(),
    );
  }

  Positioned _buildPasswordInput() {
    return Positioned(
      bottom: thirdInputBarPositinBot,
      left: inputBarSymetric,
      right: inputBarSymetric,
      child: const PasswordTextField(),
    );
  }

  Positioned _buildNavigateButton(BuildContext context) {
    return Positioned(
      bottom: loginButtonPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.35,
            child: ButtonDecorationWidget(
              buttonTitle: loginButton,
              onPressed: () async {
                changeLoading();
                await Future.delayed(Duration(seconds: duration));
                await NavigatorManager.instance.pushToPage(NavigateRoutes.home);
                changeLoading();
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.35,
            child: ButtonDecorationWidget(
              buttonTitle: registerButton,
              onPressed: () async {
                await NavigatorManager.instance
                    .pushToPage(NavigateRoutes.register);
              },
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildAlternativeLoginButton(BuildContext context) {
    return Positioned(
      bottom: alternativeLoginPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              //await NavigatorManager.instance.pushToPage(NavigateRoutes.alternativeLogin);
              showModalBottomSheet(
                backgroundColor: Theme.of(context).colorScheme.background,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: radiusSheet,
                  ),
                ),
                builder: (context) {
                  return Padding(
                    padding: radiusPadding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          shape: Theme.of(context).cardTheme.shape,
                          color: Theme.of(context).cardColor,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              child: Logo(Logos.google),
                            ),
                            title: Text(
                              loginGoogle,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Text(
                alternativeLoginButton,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double alternativeLoginPositionBot = 20;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double inputBarSymetric = 15;

  //radius
  final Radius radiusSheet = const Radius.circular(30);

  //padding
  final radiusPadding = const EdgeInsets.all(16);
}
mixin _pageWord {
  final alternativeLoginButton = "Alternatif Giriş";
  final loginButton = "Giriş Yap";
  final registerButton = "Kayıt Ol";
  final loginGoogle = "Google ile giriş yap";
}

mixin _pageDuration {
  final int duration = 2;
}
