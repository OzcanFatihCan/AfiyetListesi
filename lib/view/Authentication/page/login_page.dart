import 'package:afiyetlistesi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_input_control.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView>
    with _pageSize, _pageWord, _pageDuration {
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMsg;
//login func
  void changeLoading() {
    setState(
      () {
        isLoading = !isLoading;
      },
    );
  }

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
            errorMsg = "Geçersiz email ve şifre";
          });
        }
      },
      child: Form(
        key: _formLoginKey,
        autovalidateMode: AutovalidateMode.always,
        child: _buildLoginBar(isLoading),
      ),
    );
  }

  Column _buildLoginBar(bool isLoading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: inputPadding,
          child: InputTextField(
            controller: _emailController,
            hintText: hintTextEmail,
            prefixIcon: const Icon(Icons.mail_rounded),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            errorMsg: errorMsg,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Email girişi yapınız';
              } else if (val.isValidEmail == false) {
                return 'Geçerli bir email adresi giriniz.';
              }
              return null;
            },
          ),
        ),
        InputTextField(
          controller: _passwordController,
          hintText: hintTextPassword,
          prefixIcon: const Icon(Icons.password_rounded),
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          validator: (val) {
            if (val!.isEmpty) {
              return 'Parola girişi yapınız';
            } else if (val.isValidPassword == false) {
              return 'En az 8 karakter, büyük küçük harf ve özel karakter olmalıdır.';
            }
            return null;
          },
        ),
        !isLoading
            ? _buildNavigateButton(context)
            : CircularProgressIndicator(
                color: Theme.of(context).colorScheme.background,
              ),
      ],
    );
  }

  ButtonBar _buildNavigateButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.35,
          child: ButtonDecorationWidget(
            buttonTitle: loginButton,
            onPressed: () {
              if (_formLoginKey.currentState!.validate()) {
                context.read<SignInBloc>().add(
                      SignInRequired(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
              }
            },
          ),
        ),
      ],
    );
  }
}

mixin _pageSize {
  //padding
  final inputPadding = const EdgeInsets.only(top: 15);
}
mixin _pageWord {
  final loginButton = "Giriş Yap";
  final loginGoogle = "Google ile giriş yap";
  final hintTextEmail = "Email";
  final hintTextPassword = "Parola";
}

mixin _pageDuration {
  final int duration = 2;
}
