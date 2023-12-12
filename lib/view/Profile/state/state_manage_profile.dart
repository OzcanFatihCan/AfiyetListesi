import 'package:afiyetlistesi/view/Profile/page/profile_page.dart';
import 'package:flutter/material.dart';

abstract class StateManageProfile extends State<ProfilePageView> {
  final GlobalKey<FormState> formProfileKey = GlobalKey();
  bool isEditing = false;
//profil func
  void changeEditing() {
    setState(
      () {
        isEditing = !isEditing;
      },
    );
  }
}
