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

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with TickerProviderStateMixin, _pageSize, _pageWord, _pageDuration {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

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
          _buildTabBar(),
          _buildAuthBar(),
          _buildAlternativeLoginButton(context),
        ],
      ),
    );
  }

  Positioned _buildTabBar() {
    return Positioned(
      bottom: tabBarPositionBot,
      left: tabBarSymetric,
      right: tabBarSymetric,
      child: Container(
        height: tabBarSize,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        child: TabBar(
          indicatorColor: Theme.of(context).colorScheme.secondary,
          indicatorWeight: indicatorWeight,
          controller: tabController,
          tabs: [
            Padding(
              padding: textTabBarPadding,
              child: Text(
                loginTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  shadows: [
                    Shadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8),
                      offset: buttonOffset,
                      blurRadius: blur,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: textTabBarPadding,
              child: Text(
                registerTitle,
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(shadows: [
                  Shadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    offset: buttonOffset,
                    blurRadius: blur,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildAuthBar() {
    return Positioned(
      bottom: authBarPositionBot,
      left: authBarSymetric,
      right: authBarSymetric,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.42,
        child: Card(
          color: Theme.of(context).colorScheme.onBackground,
          child: TabBarView(
            controller: tabController,
            children: [
              BlocProvider<SignInBloc>(
                create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
                child: const LoginPageView(),
              ),
              BlocProvider<SignUpBloc>(
                create: (context) => SignUpBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
                child: const RegisterPageView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildAlternativeLoginButton(BuildContext context) {
    return Positioned(
      bottom: alternativeButtonPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: AlternativeLoginPageView(),
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
