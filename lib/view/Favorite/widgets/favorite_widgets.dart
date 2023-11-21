import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/model/favorite_model.dart';
import 'package:afiyetlistesi/product/error_text.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class BuildFavoriteCard extends StatelessWidget {
  const BuildFavoriteCard({
    super.key,
    required FavoriteModel model,
  }) : _model = model;

  final FavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          PageItemSize.halfRadius(),
        ),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(
            PageItemSize.halfRadius(),
          ),
          child: _model.imagePath.isNotEmpty
              ? Image.network(
                  _model.imagePath,
                  height: PageItemSize.listPhotoHeightSize,
                  width: PageItemSize.listPhotoWidthSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: PageItemSize.listPhotoHeightSize,
                      width: PageItemSize.listPhotoWidthSize,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                )
              : const SizedBox(
                  height: PageItemSize.listPhotoHeightSize,
                  width: PageItemSize.listPhotoWidthSize,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
        title: Text(
          _model.title.isNotEmpty
              ? _model.title
              : ProjectErrorText.foodNotFound,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: PageColors.blackColor,
                fontWeight: PageFont.textFont,
              ),
        ),
        subtitle: Text(
          ProjectWords.subtitleText,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: PageColors.blackColor, fontWeight: PageFont.subtitleFont),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_forever_rounded,
            color: PageColors.activeButtonColor,
          ),
          onPressed: () {},
        ),
        onTap: () {},
      ),
    );
  }
}

class FavoriteItems {
  late List<FavoriteModel> cardItems;
  FavoriteItems() {
    cardItems = [
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl,
          title: "Bulgur Pilavı",
          category: 1),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl2, title: "Sütlaç", category: 2),
      FavoriteModel(
          imagePath: ProjectWords.photoUrl3,
          title: "Taze Fasulye",
          category: 1),
    ];
  }
}
