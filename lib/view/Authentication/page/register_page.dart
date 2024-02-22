import 'package:afiyetlistesi/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_validate_regex.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part '../view-model/state_manage_register.dart';
part '../widget/register_widget.dart';

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
        child: _BuildRegisterBar(
          emailController: _emailController,
          nameController: _nameController,
          passwordController: _passwordController,
          isLoading: isLoading,
          registerProcess: registerProcess,
        ),
      ),
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
