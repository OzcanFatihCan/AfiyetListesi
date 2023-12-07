import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/mail_text_field.dart';
import 'package:afiyetlistesi/core/name_text_field.dart';
import 'package:afiyetlistesi/core/password_text_field.dart';
import 'package:afiyetlistesi/core/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/constant/project_photo.dart';
import 'package:afiyetlistesi/view/Loading/loading_page.dart';
import 'package:afiyetlistesi/view/Login/viewModel/state_manage_user_register.dart';
import 'package:flutter/material.dart';

class UserRegisterView extends StatefulWidget {
  const UserRegisterView({super.key});

  @override
  State<UserRegisterView> createState() => _UserRegisterViewState();
}

class _UserRegisterViewState extends StateManageUserRegister
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
              _buildNameInput(),
              _buildMailInput(),
              _buildPasswordInput(),
              _buildNavigateButton(context),
            ],
          ),
        );

  Positioned _buildNameInput() {
    return Positioned(
      bottom: firstInputBarPositionBot,
      left: inputBarSymetric,
      right: inputBarSymetric,
      child: const NameTextField(),
    );
  }

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
              buttonTitle: registerButton,
              onPressed: () async {
                changeLoading();
                await Future.delayed(Duration(seconds: duration));
                await NavigatorManager.instance.pushToPage(NavigateRoutes.home);
                changeLoading();
              },
            ),
          ),
        ],
      ),
    );
  }
}

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double firstInputBarPositionBot = 430;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double inputBarSymetric = 15;
}
mixin _pageWord {
  final registerButton = "Kayıt Ol";
}

mixin _pageDuration {
  final int duration = 1;
}
