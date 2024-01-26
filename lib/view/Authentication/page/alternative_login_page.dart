import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
part '../widget/alternative_login_widget.dart';

class AlternativeLoginPageView extends StatelessWidget
    with _pageWord, _pageSize {
  AlternativeLoginPageView({
    required Function() googleOnTap,
    super.key,
  }) : _googleOnTap = googleOnTap;

  final Function() _googleOnTap;
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
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
                      _buildSheetNavigator(context),
                      _AlternativeOptions(
                        text: loginGoogle,
                        logo: Logo(Logos.google),
                        onTap: _googleOnTap,
                      ),
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
    );
  }

  SizedBox _buildSheetNavigator(BuildContext context) {
    return SizedBox(
      height: closeButtonSize,
      child: Stack(children: [
        Positioned(
          right: closeButtonRight,
          height: closeButtonHeight,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close_rounded),
          ),
        ),
        Divider(
          thickness: thickness,
          color: Theme.of(context).colorScheme.onSecondary,
          indent: MediaQuery.of(context).size.width * 0.38,
          endIndent: MediaQuery.of(context).size.width * 0.38,
        ),
      ]),
    );
  }
}

mixin _pageSize {
  //obj
  final double closeButtonHeight = 13;
  final double closeButtonRight = 0;
  final double closeButtonSize = 24;
  final double thickness = 3;

  //radius
  final Radius radiusSheet = const Radius.circular(30);

  //padding
  final cardPadding = const EdgeInsets.symmetric(vertical: 10);
  final radiusPadding = const EdgeInsets.only(
    left: 16,
    right: 16,
    top: 7,
  );
}
mixin _pageWord {
  final alternativeLoginButton = "Alternatif Giriş";
  final loginGoogle = "Google ile giriş yap";
  final loginFacebook = "Facebook ile giriş yap";
}
