import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/model/popular_food_model.dart';
import 'package:flutter/material.dart';

class fooddetail2 extends StatelessWidget {
  const fooddetail2({
    super.key,
    required PopularFavoriteModel model,
  }) : _model = model;

  final PopularFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'food-image-${_model.imagePath}',
              createRectTween: (Rect? begin, Rect? end) {
                return MaterialRectCenterArcTween(begin: end, end: begin);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: PageItemSize.foodDetailRadius(),
                    child: _model.imagePath.isNotEmpty
                        ? Image.network(
                            _model.imagePath,
                            height: PageItemSize.foodPhotoHeightSize,
                            width: PageItemSize.foodPhotoWidthSize,
                            fit: BoxFit.cover,
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
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
