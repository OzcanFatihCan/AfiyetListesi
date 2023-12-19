import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/components/image/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/constants/project_input_control.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';

import 'package:flutter/material.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView>
    with _pageSize, _pageWord, _pageDuration {
  final GlobalKey<FormState> formRegisterKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formRegisterKey,
        autovalidateMode: AutovalidateMode.always,
        child: Stack(
          fit: StackFit.expand,
          children: [
            BackGroundWidget(
              wallpaperUrl: ItemsofAsset.loginWallpaperUrl.fetchPhoto,
            ),
            _buildLoginBar(),
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
        height: MediaQuery.of(context).size.height * 0.42,
        child: Card(
          color: Theme.of(context).colorScheme.onBackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: inputPadding,
                child: InputTextField(
                  controller: _nameController,
                  hintText: hintTextName,
                  prefixIcon: const Icon(Icons.person),
                  keyboardType: TextInputType.name,
                ),
              ),
              InputTextField(
                controller: _emailController,
                hintText: hintTextEmail,
                prefixIcon: const Icon(Icons.mail_rounded),
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                validator: FormRegisterValidator().isNotEmptyMail,
              ),
              InputTextField(
                controller: _passwordController,
                hintText: hintTextPassword,
                prefixIcon: const Icon(Icons.password_rounded),
                keyboardType: TextInputType.visiblePassword,
                autofillHints: const [AutofillHints.password],
                validator: FormRegisterValidator().isNotEmptyPassword,
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
            buttonTitle: registerButton,
            onPressed: () async {},
          ),
        ),
      ],
    );
  }
}

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double positionBot = 200;

  final double firstInputBarPositionBot = 430;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double inputBarSymetric = 15;

  //padding
  final inputPadding = const EdgeInsets.only(top: 14);
}
mixin _pageWord {
  final registerButton = "Kayıt Ol";
  final hintTextEmail = "Email";
  final hintTextPassword = "Parola";
  final hintTextName = "Adınız";
}

mixin _pageDuration {
  final int duration = 2;
}

class FormRegisterValidator {
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
