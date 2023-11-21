import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/view/Login/page/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AfiyetListesi());
}

class AfiyetListesi extends StatelessWidget {
  const AfiyetListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afiyet Listesi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: PageColors.deactivedScafooldColor,
          elevation: PageItemSize.elevationValueOff,
          foregroundColor: PageColors.blackColor,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: PageColors.blackColor,
                fontWeight: PageFont.headFont,
              ),
        ),
      ),
      home: const LoginPageView(),
    );
  }
}
