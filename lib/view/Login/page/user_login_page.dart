import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/mail_text_field.dart';
import 'package:afiyetlistesi/product/components/text/password_text_field.dart';
import 'package:afiyetlistesi/product/components/image/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/constants/project_input_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/view/Loading/page/loading_page.dart';
import 'package:afiyetlistesi/view/Login/page/user_alternative_login.dart';
import 'package:afiyetlistesi/view/Login/viewModel/state_manage_user_login.dart';

import 'package:flutter/material.dart';

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
          body: Form(
            key: formLoginKey,
            autovalidateMode: AutovalidateMode.always,
            child: Stack(
              fit: StackFit.expand,
              children: [
                BackGroundWidget(
                  wallpaperUrl: ItemsofAsset.loginWallpaperUrl.fetchPhoto,
                ),
                _buildLoginBar(),
                _buildAlternativeLoginButton(context),
              ],
            ),
          ),
        );

  Positioned _buildLoginBar() {
    return Positioned(
      bottom: positionBot,
      left: inputBarSymetric,
      right: inputBarSymetric,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: Card(
          color: Theme.of(context).colorScheme.onBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: inputPadding,
                child: MailTextField(
                  validator: FormLoginValidator().isNotEmptyMail,
                ),
              ),
              PasswordTextField(
                validator: FormLoginValidator().isNotEmptyPassword,
              ),
              _buildNavigateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  ButtonBar _buildNavigateButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
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
          height: MediaQuery.of(context).size.height * 0.06,
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
    );
  }

  Positioned _buildAlternativeLoginButton(BuildContext context) {
    return Positioned(
      bottom: alternativeLoginPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: AlternativeLoginPageView(),
    );
  }
}

mixin _pageSize {
  //obj
  final double loginButtonSymetric = 15;
  final double alternativeLoginPositionBot = 20;
  final double positionBot = 200;
  final double inputBarSymetric = 15;

  //padding
  final inputPadding = const EdgeInsets.only(top: 14);
}
mixin _pageWord {
  final loginButton = "Giriş Yap";
  final registerButton = "Kayıt Ol";
  final loginGoogle = "Google ile giriş yap";
}

mixin _pageDuration {
  final int duration = 2;
}

class FormLoginValidator {
  String? isNotEmptyMail(String? data) {
    return (data?.isValidEmail ?? false)
        ? null
        : "Geçerli bir email adresi giriniz.";
  }

  String? isNotEmptyPassword(String? data) {
    return (data?.isValidPassword ?? false)
        ? null
        : "En az 8 karakter, büyük küçük harf ve özel karakter olmalıdır.";
  }
}
