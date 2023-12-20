import 'package:afiyetlistesi/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_input_control.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView>
    with _pageSize, _pageWord, _pageDuration {
  bool isLoading = false;
  final GlobalKey<FormState> _formRegisterKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Register func
  void changeLoading() {
    setState(
      () {
        isLoading = !isLoading;
      },
    );
  }

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
          return;
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
              return 'Email girişi yapınız';
            } else if (val.isValidEmail == false) {
              return 'Geçerli bir email adresi giriniz.';
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
              return 'Parola girişi yapınız';
            } else if (val.isValidPassword == false) {
              return 'En az 8 karakter, büyük küçük harf ve özel karakter olmalıdır.';
            }
            return null;
          },
        ),
        !isLoading
            ? _buildNavigateButton(context)
            : const CircularProgressIndicator(),
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
              if (_formRegisterKey.currentState!.validate()) {
                MyUser myUser = MyUser.empty;
                myUser = myUser.copyWith(
                  email: _emailController.text,
                  name: _nameController.text,
                );

                setState(() {
                  context
                      .read<SignUpBloc>()
                      .add(SignUpRequired(myUser, _passwordController.text));
                });
              }
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
}

mixin _pageDuration {
  final int duration = 2;
}

class FormRegisterValidator {
  String? isNotEmptyMail(String? data) {
    return (data?.isValidEmail ?? false)
        ? null
        : "Geçerli bir email adresi giriniz.";
  }

  String? isNotEmptyPassword(String? data) {
    return (data?.isValidPassword ?? false)
        ? null
        : "En az 8 karakter, büyük küçük harf ve özel karakter olmalıdır.";
  }
}