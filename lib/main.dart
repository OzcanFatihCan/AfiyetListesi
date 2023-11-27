import 'package:afiyetlistesi/theme/theme_page.dart';
import 'package:afiyetlistesi/view/Login/page/login_page.dart';

import 'package:flutter/material.dart';

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
      theme: ThemePage().theme,
      home: const LoginPageView(),
    );
  }
}
