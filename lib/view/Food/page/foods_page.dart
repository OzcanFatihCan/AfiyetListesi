import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/view/Food/widgets/food_widgets.dart';
import 'package:flutter/material.dart';

class FoodsPageView extends StatelessWidget {
  const FoodsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      appBar: AppBar(),
      body: Padding(
        padding: PageItemSize.pagePadding2x,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FoodPageHeadText(),
            const SizedBox(height: PageItemSize.spaceObjects),
            const FoodPageSearchBarWidget(),
            const SizedBox(height: PageItemSize.spaceObjects),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FoodPageContentButton(),
            ),
            const SizedBox(height: PageItemSize.spaceObjectsMin),
            const FoodPageIntermediateText(),
            const SizedBox(height: PageItemSize.spaceObjects),
            SizedBox(
              height: 280,
              width: 200,
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: PageItemSize.pagePadding2x,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image.network(
                          'https://cdn.yemek.com/mncrop/940/625/uploads/2015/05/bulgur-pilavi-yemekcom.jpg',
                          height: 150,
                          width: 150,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Yemek İsmi',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.black,
      ),
    );
  }
}
