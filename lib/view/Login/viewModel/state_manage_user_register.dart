import 'package:afiyetlistesi/view/Login/page/user_register_page.dart';
import 'package:flutter/material.dart';

abstract class StateManageUserRegister extends State<UserRegisterView> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
