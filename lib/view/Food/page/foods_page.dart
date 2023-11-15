import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
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
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: PageItemSize.cardHeightSize,
                width: PageItemSize.cardWidthSize,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      PageItemSize.halfRadius(),
                    ),
                  ),
                  elevation: 8,
                  color: PageColors.cardColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: PageItemSize.pagePadding2x,
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(PageItemSize.halfRadius()),
                            child: ProjectWords.photoUrl.isNotEmpty
                                ? Image.network(
                                    ProjectWords.photoUrl,
                                    height: PageItemSize.foodPhotoHeightSize,
                                    width: PageItemSize.foodPhotoWidthSize,
                                    fit: BoxFit.fitHeight,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const SizedBox(
                                        width: PageItemSize.foodPhotoWidthSize,
                                        height:
                                            PageItemSize.foodPhotoHeightSize,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox(
                                    height: PageItemSize.foodPhotoHeightSize,
                                    width: PageItemSize.foodPhotoWidthSize,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )),
                      ),
                      Padding(
                        padding: PageItemSize.objectPadding2x,
                        child: Text(
                          'Yemek İsmi',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: PageColors.blackColor,
                                    fontWeight: FoodPageFont.cardTextFont,
                                  ),
                        ),
                      ),
                    ],
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
