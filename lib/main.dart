import 'package:afiyetlistesi/firebase_options.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/view/Login/bloc/auth_bloc_manage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
    create: (context) => AuthBloc(),
    child: const AfiyetListesi(),
  ));
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
