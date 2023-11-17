import 'package:afiyetlistesi/core/button_decoration.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/view/PageControl/page/control_page.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: PageItemSize.loginButtonPositionBot,
      left: PageItemSize.loginButtonSymetric,
      right: PageItemSize.loginButtonSymetric,
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          ButtonDecoration(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageControlView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
