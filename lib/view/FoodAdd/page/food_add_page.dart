import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:flutter/material.dart';
part '../widget/food_add_button_widget.dart';

class FoodAddPageView extends StatefulWidget {
  const FoodAddPageView({super.key});

  @override
  State<FoodAddPageView> createState() => _FoodAddPageViewState();
}

class _FoodAddPageViewState extends State<FoodAddPageView>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          pageName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: Stack(
                children: [],
              ),
            ),
            Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.150,
                        child: SingleChildScrollView(
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Malzemeler'),
                            maxLines: null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: objectPadding,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.250,
                          child: SingleChildScrollView(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Yapılış'),
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                      _BuildFoodAddButton(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

mixin _pageWord {
  final pageName = "Yemek Ekle";
  final camName = "Kamera";
  final galleryName = "Galeri";
  final buttonTitle = "Yemek Ekle";
}

mixin _pageSize {
  //padding
  final EdgeInsets pagePadding = const EdgeInsets.all(16);
  final EdgeInsets objectPadding = const EdgeInsets.symmetric(vertical: 10);
}
