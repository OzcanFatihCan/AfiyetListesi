import 'package:afiyetlistesi/view/Login/page/login_page.dart';
import 'package:afiyetlistesi/view/PageControl/page/control_page.dart';

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
          appBarTheme: const AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      )),
      home: const LoginPageView(),
    );
  }
}
