import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/mail_text_field.dart';
import 'package:afiyetlistesi/product/components/text/name_text_field.dart';
import 'package:afiyetlistesi/product/components/text/password_text_field.dart';
import 'package:afiyetlistesi/product/components/image/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/constants/project_input_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/service/auth_service.dart';
import 'package:afiyetlistesi/view/Login/model/login_user_model.dart';
import 'package:flutter/material.dart';

class UserRegisterView extends StatefulWidget {
  const UserRegisterView({super.key});

  @override
  State<UserRegisterView> createState() => _UserRegisterViewState();
}

class _UserRegisterViewState extends State<UserRegisterView>
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
                child: NameTextField(
                  controller: _nameController,
                ),
              ),
              MailTextField(
                controller: _emailController,
                validator: FormRegisterValidator().isNotEmptyMail,
              ),
              PasswordTextField(
                controller: _passwordController,
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
            onPressed: () async {
              //await Future.delayed(Duration(seconds: duration));
              //await NavigatorManager.instance.pushToPage(NavigateRoutes.home);
              AuthService().signUpWithEmail(
                UserModel(
                  userEmail: _emailController.text,
                  userPasw: _passwordController.text,
                  userName: _nameController.text,
                ),
              );
            },
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
