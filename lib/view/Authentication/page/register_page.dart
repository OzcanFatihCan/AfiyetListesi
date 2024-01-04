import 'package:afiyetlistesi/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_validate_regex.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part '../viewModel/state_manage_register.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends StateManageRegister
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            isLoading = false;
          });
        } else if (state is SignUpProcess) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignUpFailure) {
          setState(() {
            showSnackbar(registerError);
            isLoading = false;
          });
        }
      },
      child: Form(
        key: _formRegisterKey,
        autovalidateMode: AutovalidateMode.always,
        child: _buildRegisterBar(),
      ),
    );
  }

  Column _buildRegisterBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: inputPadding,
          child: InputTextField(
            controller: _nameController,
            hintText: hintTextName,
            prefixIcon: const Icon(Icons.person),
            keyboardType: TextInputType.name,
            validator: (val) {
              if (val!.isEmpty) {
                return nameValidateEmpty;
              }
              return null;
            },
          ),
        ),
        InputTextField(
          controller: _emailController,
          hintText: hintTextEmail,
          prefixIcon: const Icon(Icons.mail_rounded),
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          validator: (val) {
            if (val!.isEmpty) {
              return emailValidateEmpty;
            } else if (val.isValidEmail == false) {
              return emailValidateFalse;
            }
            return null;
          },
        ),
        InputTextField(
          controller: _passwordController,
          hintText: hintTextPassword,
          prefixIcon: const Icon(Icons.password_rounded),
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          validator: (val) {
            if (val!.isEmpty) {
              return passwordValidateEmpty;
            } else if (val.isValidPassword == false) {
              return passwordValidateFalse;
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
            buttonTitle: registerButton,
            onPressed: () {
              registerProcess();
            },
          ),
        ),
      ],
    );
  }
}

mixin _pageSize {
  final double loginButtonPositionBot = 175;
  final double loginButtonSymetric = 15;
  final double positionBot = 200;
  //duration
  final int snackBarDuration = 2;

  final double firstInputBarPositionBot = 430;
  final double secondInputBarPositionBot = 360;
  final double thirdInputBarPositinBot = 290;
  final double inputBarSymetric = 15;

  //padding
  final inputPadding = const EdgeInsets.only(top: 15);
}
mixin _pageWord {
  final registerButton = "Kayıt Ol";
  final hintTextEmail = "Email";
  final hintTextPassword = "Parola";
  final hintTextName = "Adınız";
  final registerError = "Kullanıcı zaten mevcut";
  final registerValidatorError = "Lütfen bütün hücreleri doldurunuz";
  final emailValidateEmpty = "Email girişi yapınız";
  final emailValidateFalse = "Geçerli bir email adresi giriniz";
  final passwordValidateEmpty = "Parola girişi yapınız";
  final passwordValidateFalse =
      "En az 8 karakter, büyük küçük harf ve özel karakter olmalıdır";
  final nameValidateEmpty = "Adınızı giriniz";
}
