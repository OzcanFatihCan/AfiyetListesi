import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/model/favorite_model.dart';
import 'package:afiyetlistesi/view/Favorite/widgets/favorite_widgets.dart';
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
    _cardItems = FavoriteItems().cardItems;
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
            return BuildFavoriteCard(model: _cardItems[index]);
          },
        ),
      ),
    );
  }
}
