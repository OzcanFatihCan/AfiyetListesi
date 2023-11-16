import 'package:afiyetlistesi/core/color_set.dart';
import 'package:flutter/material.dart';

class PersonPageView extends StatelessWidget {
  const PersonPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      body: Center(
        child: Text("Kişi ayar Sayfası"),
      ),
    );
  }
}
