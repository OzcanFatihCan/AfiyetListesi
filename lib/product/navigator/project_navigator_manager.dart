//sayfa geçişlerindeki logicleri kontrol et

import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:flutter/widgets.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateRoutes route, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(
      route.withUrl,
      arguments: arguments,
    );
  }

  void navigateToWidget(NavigateRoutes route, {Object? arguments}) {
    _navigatorGlobalKey.currentState?.pushNamed(
      route.withUrl,
      arguments: arguments,
    );
  }
}
