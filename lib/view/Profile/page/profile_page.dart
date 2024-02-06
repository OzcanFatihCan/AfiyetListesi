import 'package:afiyetlistesi/product/components/button/button_decoration.dart';
import 'package:afiyetlistesi/product/package/image/photo_picker.dart';
import 'package:afiyetlistesi/product/package/toast/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:lottie/lottie.dart';

import 'package:afiyetlistesi/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:afiyetlistesi/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/package/dotted/dotted_frame.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';

part '../widget/profil_photo_widget.dart';
part '../widget/profil_text_widget.dart';
part '../viewModel/state_manage_profile.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({
    super.key,
  });

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends StateManageProfile
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
      listener: (context, state) {
        if (state is UploadPictureSuccess) {
          setState(() {
            context.read<MyUserBloc>().state.user!.picture = state.userImage;
            ToastService.showToast(
              icon: Icons.check_circle,
              message: updatePhoto,
              context: context,
            );
          });
        }
        if (state is UpdateUserDataSuccess) {
          setState(() {
            context.read<MyUserBloc>().state.user!.name = nameController.text;
            ToastService.showToast(
              icon: Icons.check_circle,
              message: updateSuccess,
              context: context,
            );
          });
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Form(
            key: formProfileKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: pagePadding2x,
              child: SingleChildScrollView(
                child: BlocBuilder<MyUserBloc, MyUserState>(
                  builder: (context, state) {
                    if (state.status == MyUserStatus.success) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _BuildProfilPhoto(
                            state: state,
                            onTap: () async {
                              await showImagePicker();
                            },
                          ),
                          _BuildTextBody(
                            state: state,
                            nameController: nameController,
                            isEditing: isEditing,
                            stateOnPressed: () {
                              changeEditing();
                            },
                            buttonOnPressed: () {
                              updateProfilInfo(context);
                            },
                          )
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Lottie.asset(
                              ItemsofAsset.lottieLoading.fetchLottie,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mixin _pageSize {
  //obj
  final double indent = 30;
  final double iconPosition = 0;
  final double plusIconTop = 195;
  final double plusIconRight = 65;
  final double aspectValue = 1;
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
  final objectPadding = const EdgeInsets.only(top: 20);
  final textPadding = const EdgeInsets.symmetric(vertical: 20);

  //radius
  final cardRadius = BorderRadius.circular(30);
  //elevation
  final double elevationValueOff = 0;
}
mixin _pageWord {
  final profileTitle = "Profili Düzenle";
  final hintTextEmail = "Email";
  final hintTextName = "Adınız";
  final updateButtonText = "Güncelle";
  final updateSuccess = "Adınız güncellendi";
  final updatePhoto = "Fotoğrafınız güncellendi";
  final errorName = "Lütfen ismi boş bırakmayınız";
  final profilPhoto = "ProfilePhoto";
}
