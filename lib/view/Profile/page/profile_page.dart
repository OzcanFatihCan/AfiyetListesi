import 'package:afiyetlistesi/blocs/my_user_bloc/my_user_bloc.dart';
import 'package:afiyetlistesi/blocs/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:afiyetlistesi/product/components/text/input_text_field.dart';
import 'package:afiyetlistesi/product/constants/project_validate_regex.dart';
import 'package:afiyetlistesi/product/package/dotted/dotted_frame.dart';
import 'package:afiyetlistesi/product/constants/project_photo.dart';
import 'package:afiyetlistesi/product/package/image/photo_picker.dart';
import 'package:afiyetlistesi/theme/app_theme.dart';
import 'package:afiyetlistesi/view/Profile/state/state_manage_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:lottie/lottie.dart';

part '../widget/profil_photo_widget.dart';

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
          });
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Form(
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
                        ),
                        _buildTextBody(context, state)
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  Padding _buildTextBody(BuildContext context, MyUserState state) {
    return Padding(
      padding: objectPadding,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        shape: AppTheme().customCardTheme().shape,
        elevation: elevationValueOff,
        child: Stack(
          children: [
            Padding(
              padding: pagePadding2x,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: spaceObjects),
                    child: Text(
                      profileTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  InputTextField(
                    controller: nameController,
                    isEditing: isEditing,
                    hintText: hintTextName,
                    prefixIcon: const Icon(Icons.person),
                    keyboardType: TextInputType.name,
                    initialValue:
                        state.user!.name.isNotEmpty ? state.user!.name : null,
                  ),
                  InputTextField(
                    controller: emailController,
                    initialValue:
                        state.user!.email.isNotEmpty ? state.user!.email : null,
                    isEditing: isEditing,
                    hintText: hintTextEmail,
                    prefixIcon: const Icon(Icons.mail_rounded),
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    validator: FormProfilValidator().isNotEmptyMail,
                  ),
                ],
              ),
            ),
            Positioned(
              top: iconPosition,
              right: iconPosition,
              child: _buildEditButton(),
            )
          ],
        ),
      ),
    );
  }

  Row _buildEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: isEditing
              ? Icon(
                  Icons.check_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              : Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          onPressed: () {
            changeEditing();
          },
        ),
      ],
    );
  }
}

mixin _pageSize {
  //obj
  final double spaceObjects = 20;
  final double indent = 30;
  final double thickness = 2;
  final double iconPosition = 0;
  //padding
  final pagePadding2x = const EdgeInsets.all(16.0);
  final objectPadding = const EdgeInsets.only(top: 20);
  //elevation
  final double elevationValueOff = 0;
}
mixin _pageWord {
  final profileTitle = "Profili Düzenle";
  final profilPhotoUrl =
      "https://image.tmdb.org/t/p/original/mbMsmQE5CyMVTIGMGCw2XpcPCOc.jpg";

  final hintTextEmail = "Email";
  final hintTextPassword = "Parola";
  final hintTextName = "Adınız";
  final cropperName = "Kırp";
}

class FormProfilValidator {
  String? isNotEmptyMail(String? data) {
    return (data?.isValidEmail ?? false)
        ? null
        : "Geçerli bir email adresi giriniz.";
  }

  String? isNotEmptyPassword(String? data) {
    return (data?.isValidPassword ?? false)
        ? null
        : "En az 8 karakter, büyük küçük harf ve özel karakter olmalıdır.";
  }
}
