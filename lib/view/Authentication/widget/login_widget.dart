part of '../page/login_page.dart';

class _BuildLoginBar extends StatelessWidget with _pageSize, _pageWord {
  _BuildLoginBar({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required bool isLoading,
    required Function() loginProcess,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _isLoading = isLoading,
        _loginProcess = loginProcess,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool _isLoading;
  final Function() _loginProcess;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: inputPadding,
          child: InputTextField(
            controller: _emailController,
            hintText: hintTextEmail,
            prefixIcon: const Icon(Icons.mail_rounded),
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            validator: (val) {
              if (val!.isEmpty) {
                return 'Email girişi yapınız';
              } else if (val.isValidEmail == false) {
                return 'Geçerli bir email adresi giriniz.';
              }
              return null;
            },
          ),
        ),
        InputTextField(
          controller: _passwordController,
          hintText: hintTextPassword,
          prefixIcon: const Icon(Icons.password_rounded),
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          validator: (val) {
            if (val!.isEmpty) {
              return 'Parola girişi yapınız';
            } else if (val.isValidPassword == false) {
              return 'En az 8 karakter, büyük küçük harf ve özel karakter olmalıdır.';
            }
            return null;
          },
        ),
        !_isLoading
            ? _buildNavigateButton(context)
            : CircularProgressIndicator(
                color: Theme.of(context).colorScheme.background,
              ),
      ],
    );
  }

  ButtonBar _buildNavigateButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.37,
          child: ButtonDecorationWidget(
            buttonTitle: loginButton,
            onPressed: () {
              _loginProcess();
            },
          ),
        ),
      ],
    );
  }
}
