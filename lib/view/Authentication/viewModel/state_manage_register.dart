part of '../page/register_page.dart';

abstract class StateManageRegister extends State<RegisterPageView>
    with _pageSize, _pageWord {
  bool isLoading = false;
  final GlobalKey<FormState> _formRegisterKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        content: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        duration: Duration(
          seconds: snackBarDuration,
        ),
      ),
    );
  }

  registerProcess() {
    if (_formRegisterKey.currentState!.validate()) {
      MyUser myUser = MyUser.empty;
      myUser = myUser.copyWith(
        email: _emailController.text,
        name: _nameController.text,
      );
      setState(() {
        context
            .read<SignUpBloc>()
            .add(SignUpRequired(myUser, _passwordController.text));
      });
    } else {
      setState(() {
        showSnackbar(registerValidatorError);
      });
    }
  }
}
