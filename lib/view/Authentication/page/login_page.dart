import 'package:afiyetlistesi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_validate_regex.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../view-model/state_manage_login.dart';
part '../widget/login_widget.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends StateManageLogin with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            isLoading = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            isLoading = false;
            showSnackbar(loginError);
          });
        }
      },
      child: Form(
        key: _formLoginKey,
        autovalidateMode: AutovalidateMode.always,
        child: _BuildLoginBar(
          emailController: _emailController,
          passwordController: _passwordController,
          isLoading: isLoading,
          loginProcess: loginProcess,
        ),
      ),
    );
  }
}

mixin _pageSize {
  //padding
  final inputPadding = const EdgeInsets.only(top: 15);
  //duration
  final int snackBarDuration = 2;
}
mixin _pageWord {
  final loginButton = "Giriş Yap";
  final loginGoogle = "Google ile giriş yap";
  final hintTextEmail = "Email";
  final hintTextPassword = "Parola";
  final loginError = "Geçersiz email ve şifre";
  final loginValidateError = "Hücreleri şartlara göre doldurunuz";
}
