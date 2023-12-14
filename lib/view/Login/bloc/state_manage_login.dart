import 'package:afiyetlistesi/view/Login/page/login_page.dart';
import 'package:flutter/material.dart';

abstract class StateManageLogin extends State<LoginPageView> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
