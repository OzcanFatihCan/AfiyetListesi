import 'package:afiyetlistesi/view/Home/Page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AfiyetListesi());
}

class AfiyetListesi extends StatelessWidget {
  const AfiyetListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Afiyet Listesi',
        debugShowCheckedModeBanner: false,
        home: HomePageView());
  }
}
