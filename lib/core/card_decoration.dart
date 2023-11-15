import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class CardDecorationWidget extends StatelessWidget {
  const CardDecorationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                borderRadius: BorderRadius.all(PageItemSize.halfRadius()),
                child: ProjectWords.photoUrl.isNotEmpty
                    ? Image.network(
                        ProjectWords.photoUrl,
                        height: PageItemSize.foodPhotoHeightSize,
                        width: PageItemSize.foodPhotoWidthSize,
                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            width: PageItemSize.foodPhotoWidthSize,
                            height: PageItemSize.foodPhotoHeightSize,
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
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: PageColors.blackColor,
                    fontWeight: FoodPageFont.cardTextFont,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}