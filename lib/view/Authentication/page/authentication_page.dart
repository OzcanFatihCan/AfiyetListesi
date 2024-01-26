import 'package:afiyetlistesi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:afiyetlistesi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:afiyetlistesi/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:afiyetlistesi/product/components/image/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/view/Authentication/page/login_page.dart';
import 'package:afiyetlistesi/view/Authentication/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'alternative_login_page.dart';
part '../widget/authentication_tab_widget.dart';
part '../widget/authentication_auth_widget.dart';
part '../viewModel/state_manage_authenticationpage.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends StateManageAuthenticationPage
    with _pageSize, _pageWord, _pageDuration {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackGroundWidget(
            wallpaperUrl: ItemsofAsset.loginWallpaperUrl.fetchPhoto,
          ),
          _BuildTabBar(tabController: tabController),
          _BuildAuthBar(tabController: tabController),
          _buildAlternativeLoginButton(context),
        ],
      ),
    );
  }

  Positioned _buildAlternativeLoginButton(BuildContext context) {
    return Positioned(
      bottom: alternativeButtonPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: BlocProvider(
        create: (context) => SignInBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository,
        ),
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return AlternativeLoginPageView(
              googleOnTap: () {
                context.read<SignInBloc>().add(
                      GoogleSignInRequired(),
                    );
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double alternativeButtonPositionBot = 20;
  final double authBarPositionBot = 170;
  final double tabBarPositionBot = 495;

  final double firstInputBarPositionBot = 430;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double authBarSymetric = 15;
  final double tabBarSymetric = 25;
  final double indicatorWeight = 5;
  final double tabBarSize = 45;

  final double blur = 4;
  final Offset buttonOffset = const Offset(0, 2);

  //padding
  final inputPadding = const EdgeInsets.only(top: 14);
  final textTabBarPadding = const EdgeInsets.only(bottom: 3);
}
mixin _pageWord {
  final registerTitle = "Kayıt Ol";
  final loginTitle = "Giriş Yap";
  final hintTextEmail = "Email";
  final hintTextPassword = "Parola";
  final hintTextName = "Adınız";
  final loginGoogle = "Google ile giriş yap";
}

mixin _pageDuration {
  final int duration = 2;
}
