import 'package:afiyetlistesi/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:afiyetlistesi/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:afiyetlistesi/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:flutter/material.dart';

import 'package:afiyetlistesi/view/Home/state/state_manage_home.dart';
import 'package:afiyetlistesi/product/package/dotted/dotted_frame.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';

import 'package:afiyetlistesi/view/Popular/page/popular_page.dart';
import 'package:afiyetlistesi/view/Favorite/page/favorite_page.dart';
import 'package:afiyetlistesi/view/Food/page/food_page.dart';
import 'package:afiyetlistesi/view/Profile/page/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

part '../widget/drawer_widget.dart';
part '../widget/navigation_bar_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends StateManageHome with _pageWords {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
      listener: (context, state) {
        if (state is UploadPictureSuccess) {
          setState(() {
            context.read<MyUserBloc>().state.user!.picture = state.userImage;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            PageName.values[currentPage].getPageTitle(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: _buildPageViewWidget(),
        bottomNavigationBar: _BottomNavigationBarWidget(
          pageController: pageController,
          currentPage: currentPage,
        ),
        drawer: _BuildDrawerWidget(
          profilName: profilName,
          profilEmail: profilEmail,
          imageUrl: profilPhotoUrl,
          pageController: pageController,
        ),
      ),
    );
  }

  PageView _buildPageViewWidget() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (int index) {
        pageChange(index);
      },
      children: [
        PopularPageView(
          pageController: pageController,
        ),
        const FavoritePageView(),
        const ProfilePageView(),
        const FoodPageView(),
      ],
    );
  }
}

mixin _pageSize {
  //obj
  final int drawerLines = 1;
  final double spaceObjects = 20;
  final int textLimitx = 35;
  final int textLimit2x = 50;
  final double bottomNavHeight = 60;
  final double aspectValue = 1;
  final double thickness = 2;
//padding
  final listPadding2x = const EdgeInsets.symmetric(horizontal: 15);
  final listPaddingx = const EdgeInsets.symmetric(horizontal: 10);
  final bottomPadding = const EdgeInsets.only(bottom: 25, right: 20, left: 20);

  //elevation
  final double elevationValueOff = 0;
  final double elevationValue = 8;
}

mixin _pageDuration {
  final duration = 1;
}

mixin _pageWords {
  final profilName = "Elizabeth Olsen";
  final profilEmail = "ElizabethOlsen@gmail.com";
  final profilPhotoUrl =
      "https://image.tmdb.org/t/p/original/mbMsmQE5CyMVTIGMGCw2XpcPCOc.jpg";
}
