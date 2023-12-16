import 'package:afiyetlistesi/main.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';
import 'package:afiyetlistesi/view/Error/page/error_page.dart';
import 'package:afiyetlistesi/view/FoodAdd/page/food_add_page.dart';
import 'package:afiyetlistesi/view/FoodDetail/page/food_detail_page.dart';
import 'package:afiyetlistesi/view/Home/page/home_page.dart';
import 'package:afiyetlistesi/view/Loading/page/loading_page.dart';
import 'package:afiyetlistesi/view/Login/page/login_page.dart';
import 'package:afiyetlistesi/view/Login/page/user_login_page.dart';
import 'package:afiyetlistesi/view/Login/page/user_register_page.dart';
import 'package:afiyetlistesi/view/UserFood/page/user_food_page.dart';
import 'package:flutter/material.dart';

mixin NavigatorControl<T extends AfiyetListesi> on Widget {
  static const _firstUri = "/";

  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty == true) {
      return _navigateToError();
    }
    final arguments = routeSettings.arguments;
    final routes = routeSettings.name == _firstUri
        ? NavigateRoutes.init
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));

    switch (routes) {
      //arguman yollarsan kontrolünü burada sağla.
      case NavigateRoutes.init:
        return _navigateToNormal(const LoginPageView());
      case NavigateRoutes.login:
        return _navigateToNormal(const UserLoginView());
      case NavigateRoutes.register:
        return _navigateToNormal(const UserRegisterView());
      case NavigateRoutes.home:
        return _navigateToNormal(const HomePageView());
      case NavigateRoutes.foodAdd:
        return _navigateToNormal(const FoodAddPageView());
      case NavigateRoutes.foodDetail:
        return _navigateToNormal(
            FoodDetailPage(model: arguments as PopularFavoriteModel));
      case NavigateRoutes.userFood:
        return _navigateToNormal(const UserFoodPageView());
      case NavigateRoutes.loading:
        return _navigateToNormal(const LoadingPageView());
      default:
        return null;
    }
  }

  Route<dynamic>? _navigateToNormal(Widget child) {
    return MaterialPageRoute(
      builder: (context) {
        return child;
      },
    );
  }

  Route<dynamic>? _navigateToError() {
    return MaterialPageRoute(builder: (context) {
      return const ErrorPageView();
    });
  }
}

//App All Route
enum NavigateRoutes {
  init,
  login,
  register,
  home,
  foodAdd,
  foodDetail,
  userFood,
  loading
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
