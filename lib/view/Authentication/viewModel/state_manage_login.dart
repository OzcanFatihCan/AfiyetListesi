part of '../page/login_page.dart';

abstract class StateManageLogin extends State<LoginPageView>
    with _pageSize, _pageWord {
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

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

  loginProcess() {
    if (_formLoginKey.currentState!.validate()) {
      context.read<SignInBloc>().add(
            SignInRequired(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    } else {
      setState(() {
        isLoading = false;
        showSnackbar(loginValidateError);
      });
    }
  }
}
