part of '../page/profile_page.dart';

class _BuildTextBody extends StatefulWidget {
  const _BuildTextBody({
    Key? key,
    required this.state,
    required this.isEditing,
    required this.onPressed,
    required this.nameController,
    required this.emailController,
  }) : super(key: key);

  final MyUserState state;
  final bool isEditing;
  final void Function()? onPressed;
  final TextEditingController? nameController;
  final TextEditingController? emailController;

  @override
  State<_BuildTextBody> createState() => _BuildTextBodyState();
}

class _BuildTextBodyState extends State<_BuildTextBody>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
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
                    padding: textPadding,
                    child: Text(
                      profileTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  InputTextField(
                    controller: widget.nameController,
                    isEditing: widget.isEditing,
                    hintText: hintTextName,
                    prefixIcon: const Icon(Icons.person),
                    keyboardType: TextInputType.name,
                    initialValue: widget.state.user!.name.isNotEmpty
                        ? widget.state.user!.name
                        : null,
                  ),
                  InputTextField(
                    controller: widget.emailController,
                    initialValue: widget.state.user!.email.isNotEmpty
                        ? widget.state.user!.email
                        : null,
                    isEditing: widget.isEditing,
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
          icon: widget.isEditing
              ? Icon(
                  Icons.check_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              : Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}
