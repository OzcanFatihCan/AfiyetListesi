import 'package:afiyetlistesi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/image/wallpaper_widget.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInitPageView extends StatelessWidget
    with _pageSize, _pageWord, _pageDuration {
  AppInitPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  }

  Positioned _buildLoginButtoWidget(
    BuildContext context,
  ) {
    return Positioned(
      bottom: loginButtonPositionBot,
      left: loginButtonSymetric,
      right: loginButtonSymetric,
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.35,
              child: ButtonDecorationWidget(
                buttonTitle: loginButton,
                onPressed: () async {
                  if (state.status == AuthenticationStatus.authenticated) {
                    return await NavigatorManager.instance
                        .pushToPage(NavigateRoutes.home);
                  } else {
                    return await NavigatorManager.instance
                        .pushToPage(NavigateRoutes.login);
                  }
                },
              ),
            ),
          );
        },
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
  final int duration = 2;
}
