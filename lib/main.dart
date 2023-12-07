import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const AfiyetListesi());
}

class AfiyetListesi extends StatelessWidget with NavigatorControl {
  const AfiyetListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afiyet Listesi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
    );
  }
}
