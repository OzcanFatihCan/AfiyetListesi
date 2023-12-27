import 'package:afiyetlistesi/app_view.dart';
import 'package:afiyetlistesi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:afiyetlistesi/blocs/create_post_bloc/create_post_bloc.dart';
import 'package:afiyetlistesi/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:afiyetlistesi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:afiyetlistesi/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';
import 'package:afiyetlistesi/view/Authentication/page/authentication_page.dart';
import 'package:afiyetlistesi/view/Error/page/error_page.dart';
import 'package:afiyetlistesi/view/FoodAdd/page/food_add_page.dart';
import 'package:afiyetlistesi/view/FoodDetail/page/food_detail_page.dart';
import 'package:afiyetlistesi/view/Home/page/home_page.dart';
import 'package:afiyetlistesi/view/UserFood/page/user_food_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

import '../../app.dart';

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
}

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
        return _navigateToNormal(AppInitPageView());
      case NavigateRoutes.authentication:
        return _navigateToNormal(
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => SignInBloc(
                        userRepository:
                            context.read<AuthenticationBloc>().userRepository,
                      ),
                    ),
                    BlocProvider(
                      create: (context) => UpdateUserInfoBloc(
                        userRepository:
                            context.read<AuthenticationBloc>().userRepository,
                      ),
                    ),
                    BlocProvider(
                      create: (context) => MyUserBloc(
                        myUserRepository:
                            context.read<AuthenticationBloc>().userRepository,
                      )..add(
                          GetMyUser(
                            myUserId: context
                                .read<AuthenticationBloc>()
                                .state
                                .user!
                                .uid,
                          ),
                        ),
                    ),
                  ],
                  child: const HomePageView(),
                );
              } else {
                return const AuthenticationPage();
              }
            },
          ),
        );
      case NavigateRoutes.home:
        return _navigateToNormal(
          const HomePageView(),
        );
      case NavigateRoutes.foodAdd:
        return _navigateToNormal(
          BlocProvider<CreatePostBloc>(
            create: (context) => CreatePostBloc(
              myPostRepository: FirebasePostRepository(),
            ),
            child: FoodAddPageView(myUser: arguments as MyUser),
          ),
        );
      case NavigateRoutes.foodDetail:
        return _navigateToNormal(
          FoodDetailPage(model: arguments as PopularFavoriteModel),
        );
      case NavigateRoutes.userFood:
        return _navigateToNormal(
          const UserFoodPageView(),
        );

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
  authentication,
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
