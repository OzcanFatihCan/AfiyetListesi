import 'package:afiyetlistesi/view/Login/page/user_login_page.dart';
import 'package:flutter/material.dart';

abstract class StateManageUserLogin extends State<UserLoginView> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
