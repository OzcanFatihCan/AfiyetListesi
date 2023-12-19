import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/components/image/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/constants/project_input_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/view/Authentication/page/alternative_login_page.dart';

import 'package:flutter/material.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView>
    with _pageSize, _pageWord, _pageDuration {
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formLoginKey,
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
  }

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
                child: InputTextField(
                  controller: _emailController,
                  hintText: hintTextEmail,
                  prefixIcon: const Icon(Icons.mail_rounded),
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  validator: FormLoginValidator().isNotEmptyMail,
                ),
              ),
              InputTextField(
                controller: _passwordController,
                hintText: hintTextPassword,
                prefixIcon: const Icon(Icons.password_rounded),
                keyboardType: TextInputType.visiblePassword,
                autofillHints: const [AutofillHints.password],
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
            onPressed: () async {},
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
  final hintTextEmail = "Email";
  final hintTextPassword = "Parola";
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
