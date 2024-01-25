part of '../page/register_page.dart';

class _BuildRegisterBar extends StatelessWidget with _pageSize, _pageWord {
  _BuildRegisterBar({
    Key? key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required bool isLoading,
    required Function() registerProcess,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _isLoading = isLoading,
        _registerProcess = registerProcess,
        _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final bool _isLoading;
  final Function() _registerProcess;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: inputPadding,
          child: InputTextField(
            controller: _nameController,
            hintText: hintTextName,
            prefixIcon: const Icon(Icons.person),
            keyboardType: TextInputType.name,
            validator: (val) {
              if (val!.isEmpty) {
                return nameValidateEmpty;
              }
              return null;
            },
          ),
        ),
        InputTextField(
          controller: _emailController,
          hintText: hintTextEmail,
          prefixIcon: const Icon(Icons.mail_rounded),
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          validator: (val) {
            if (val!.isEmpty) {
              return emailValidateEmpty;
            } else if (val.isValidEmail == false) {
              return emailValidateFalse;
            }
            return null;
          },
        ),
        InputTextField(
          controller: _passwordController,
          hintText: hintTextPassword,
          prefixIcon: const Icon(Icons.password_rounded),
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const [AutofillHints.password],
          validator: (val) {
            if (val!.isEmpty) {
              return passwordValidateEmpty;
            } else if (val.isValidPassword == false) {
              return passwordValidateFalse;
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
          width: MediaQuery.of(context).size.width * 0.35,
          child: ButtonDecorationWidget(
            buttonTitle: registerButton,
            onPressed: () {
              _registerProcess();
            },
          ),
        ),
      ],
    );
  }
}
