import 'package:afiyetlistesi/main.dart';
import 'package:afiyetlistesi/view/Food/page/food_page.dart';
import 'package:afiyetlistesi/view/Home/page/home_page.dart';
import 'package:afiyetlistesi/view/Login/page/login_page.dart';
import 'package:afiyetlistesi/view/Login/page/user_alternative_login.dart';
import 'package:afiyetlistesi/view/Login/page/user_login_page.dart';
import 'package:afiyetlistesi/view/Login/page/user_register_page.dart';
import 'package:afiyetlistesi/view/UserFood/page/user_food_page.dart';
import 'package:flutter/material.dart';

mixin NavigatorControl<T extends AfiyetListesi> on Widget {
  static const _firstUri = "/";

  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty == true) {
      //hata sayfası tanımlanacak
      // return _navigateToNormal("hata sayfası");
    }

    final routes = routeSettings.name == _firstUri
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      //arguman yollarsan kontrolünü burada sağla.
      case NavigateRoutes.init:
        return _navigateToNormal(LoginPageView());
      case NavigateRoutes.login:
        return _navigateToNormal(UserLoginView());
      case NavigateRoutes.register:
        return _navigateToNormal(UserRegisterView());
      case NavigateRoutes.alternativeLogin:
        return _navigateToNormal(const AlternativeLoginPageView());
      case NavigateRoutes.home:
        return _navigateToNormal(const HomePageView());
      case NavigateRoutes.foodAdd:
        break;
      case NavigateRoutes.foodDetail:
        return _navigateToNormal(const FoodPageView());
      case NavigateRoutes.userFood:
        return _navigateToNormal(const UserFoodPageView());
    }

    return null;
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(builder: (context) {
      return child;
    });
  }
}

//App All Route
enum NavigateRoutes {
  init,
  login,
  register,
  alternativeLogin,
  home,
  foodAdd,
  foodDetail,
  userFood
}

extension NavigateRoutesExtension on NavigateRoutes {
  String get withUrl => "/$name";
}

//PageView Route
enum PageName { popular, favorite, profile, foods }

extension PageNameExtension on PageName {
  String getPageTitle() {
    switch (this) {
      case PageName.popular:
        return 'Anasayfa';
      case PageName.favorite:
        return 'Favoriler';
      case PageName.profile:
        return 'Profil';
      case PageName.foods:
        return 'Yemekler';
      default:
        return '';
    }
  }
}
