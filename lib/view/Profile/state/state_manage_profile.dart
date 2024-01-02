part of '../page/profile_page.dart';

abstract class StateManageProfile extends State<ProfilePageView> {
  final GlobalKey<FormState> formProfileKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEditing = false;
//profil func
  void changeEditing() {
    setState(
      () {
        isEditing = !isEditing;
      },
    );
  }

  showImagePicker() async {
    await ImagePickerHandler(
      context: context,
      pickerType: "ProfilPhoto",
      onSelectionFile: (dynamic selectedFile) {
        if (selectedFile is CroppedFile) {
          setState(() {
            context.read<UpdateUserInfoBloc>().add(
                  UploadPicture(
                    selectedFile.path,
                    context.read<MyUserBloc>().state.user!.id,
                  ),
                );
          });
        }
      },
    ).handleImageSelection();
  }
}
