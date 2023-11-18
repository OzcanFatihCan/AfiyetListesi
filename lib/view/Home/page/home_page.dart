import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/core/inputbar_widget.dart';
import 'package:afiyetlistesi/product/project_words.dart';

import 'package:afiyetlistesi/view/Home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PageColors.mainPageColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Padding(
          padding: PageItemSize.pagePadding2x,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageHeadText(),
              SizedBox(height: PageItemSize.spaceObjects),
              InputBarWidget(
                hint: ProjectWords.searchHint,
                icon: Icons.search_rounded,
              ),
              SizedBox(height: PageItemSize.spaceObjects),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HomePageContentButton(),
              ),
              SizedBox(height: PageItemSize.spaceObjectsMin),
              HomePageMiddleWidget(),
              SizedBox(height: PageItemSize.spaceObjects),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HomePagePopular(),
              ),
              SizedBox(height: PageItemSize.spaceObjectsMin),
            ],
          ),
        ),
      ),
    );
  }
}
