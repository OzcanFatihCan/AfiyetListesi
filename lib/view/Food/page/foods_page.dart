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
            FoodPageHeadText(),
            SizedBox(height: PageItemSize.spaceObjects),
            FoodPageSearchBarWidget(),
            SizedBox(height: PageItemSize.spaceObjects),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FoodPageContentButton(),
            ),
            SizedBox(height: PageItemSize.spaceObjectsMin),
            FoodPageIntermediateText(),
            SizedBox(height: PageItemSize.spaceObjects),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FoodPagePopular(),
            ),
            SizedBox(height: PageItemSize.spaceObjectsMin),
            SizedBox(
              height: 70,
              width: 370,
              child: Padding(
                padding: PageItemSize.cardPaddingx,
                child: Card(
                  color: PageColors.cardColor,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.restaurant_menu_rounded),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_rounded),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.person),
                        ),
                      ],
                    ),
                  ),
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
