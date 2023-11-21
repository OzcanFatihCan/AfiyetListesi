import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends State<FavoritePageView> {
  late List<FavoriteModel> _cardItems;

  @override
  void initState() {
    super.initState();
    _cardItems = [
      FavoriteModel(imagePath: ProjectWords.photoUrl, title: "Bulgur Pilavı"),
      FavoriteModel(imagePath: ProjectWords.photoUrl2, title: "Sütlaç"),
      FavoriteModel(imagePath: ProjectWords.photoUrl3, title: "Taze Fasulye"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColors.mainPageColor,
      body: Padding(
        padding: PageItemSize.pagePadding2x,
        child: ListView.builder(
          itemCount: _cardItems.length,
          itemBuilder: (context, index) {
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
                  child: _cardItems[index].imagePath.isNotEmpty
                      ? Image.network(
                          _cardItems[index].imagePath,
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
                  _cardItems[index].title,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: PageColors.blackColor,
                        fontWeight: PageFont.textFont,
                      ),
                ),
                subtitle: Text(
                  "Yemek tarifi için tıklayınız",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: PageColors.blackColor,
                      fontWeight: PageFont.subtitleFont),
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
          },
        ),
      ),
    );
  }
}

class FavoriteModel {
  final String imagePath;
  final String title;

  FavoriteModel({required this.imagePath, required this.title});
}
