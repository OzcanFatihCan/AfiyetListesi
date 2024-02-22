import 'package:afiyetlistesi/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:afiyetlistesi/blocs/delete_post_bloc/delete_post_bloc.dart';
import 'package:afiyetlistesi/blocs/get_post_bloc/get_post_bloc.dart';
import 'package:afiyetlistesi/product/constants/project_category_manager.dart';
import 'package:afiyetlistesi/product/constants/project_food_detail_type_manager.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/product/package/toast/toast_message.dart';
import 'package:afiyetlistesi/view/Error/page/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:post_repository/post_repository.dart';
import 'package:user_repository/user_repository.dart';

part '../widget/content_ufood_button_widget.dart';
part '../widget/user_food_card_widget.dart';
part '../view-model/state_manage_user_food.dart';
part '../widget/post_builder.dart';

class UserFoodPageView extends StatefulWidget {
  const UserFoodPageView({required this.myUser, super.key});
  final MyUser myUser;

  @override
  State<UserFoodPageView> createState() => _UserFoodPageViewState();
}

class _UserFoodPageViewState extends StateManageUserFood with _pageSize {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetPostBloc(
            postRepository: FirebasePostRepository(),
          )..add(
              GetPosts(userId: userId),
            ),
        ),
        BlocProvider(
          create: (context) => DeletePostBloc(
            myPostRepository: FirebasePostRepository(),
          ),
        ),
      ],
      child: BlocListener<DeletePostBloc, DeletePostState>(
        listener: (context, deleteState) {
          if (deleteState is DeletePostSuccess) {
            ToastService.showToast(
              icon: Icons.check_circle,
              message: foodDeleteSucces,
              context: context,
            );
            context.read<GetPostBloc>().add(
                  GetPosts(userId: userId),
                );
            currentPageNotifier.value =
                CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            title: Text(
              appText,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: Column(
            children: [
              _BuildContentButton(
                currentPageNotifier: currentPageNotifier,
                contentChange: contentChange,
                pageChange: pageChange,
              ),
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildContent(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: pagePadding2x,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<GetPostBloc, GetPostState>(
            builder: (context, postState) {
              if (postState is GetPostSuccess) {
                foodPosts = postState.posts;
                return _PostBuilder(
                  pageController: pageController,
                  foodPosts: foodPosts,
                  userId: userId,
                  widget: widget,
                  userFoodError: userFoodError,
                  deletePostFunc: postDeleteFunc,
                  detailPostFunc: postDetailFunc,
                );
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    ItemsofAsset.lottieLoading.fetchLottie,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double listPhotoHeightSize = 60;
  final double listPhotoWidthSize = 80;
  final double contentButtonHeight = 50;
  final double contentButtonWidght = 100;
  final double optionDot = 7;
  final double cardLineThickness = 3;
  //radius
  final halfRadius = const Radius.circular(15);
  final buttonOnRadius = BorderRadius.circular(15);
  final buttonOffRadius = BorderRadius.circular(7);
  //padding - margin
  final pagePadding2x = const EdgeInsets.all(16.0);
  final contentButtonPadding = const EdgeInsets.symmetric(horizontal: 16);
  final contentButtonMargin = const EdgeInsets.all(5);

  //duration
  final duration = 1;
}

mixin _pageWord {
  final appText = "Yemeklerim";
  final subtitleText = "Tarif için tıkla";
  final foodNotFound = "Yemek adı bulunamadı";
  final deleteFood = "Bu yemeği silmek istediğinizden emin misiniz?";
  final deleteFoodTitle = "Yemeği Sil";
  final cancelButton = "İptal";
  final okButton = "Sil";
  final userFoodError = "Henüz bu kategoride ekleme yapmadınız";
  final foodDeleteSucces = "Yemek silindi";
}
