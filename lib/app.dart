import 'package:afiyetlistesi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'product/navigator/project_navigator_manager.dart';
import 'theme/app_theme.dart';

class AfiyetListesi extends StatelessWidget with NavigatorControl {
  const AfiyetListesi(this.userRepository, {super.key});

  final UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(myUserRepository: userRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Afiyet Listesi',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme,
        onGenerateRoute: onGenerateRoute,
        navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      ),
    );
  }
}
