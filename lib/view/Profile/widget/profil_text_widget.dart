part of '../page/profile_page.dart';

class _BuildTextBody extends StatefulWidget {
  const _BuildTextBody({
    Key? key,
    required this.state,
    required this.isEditing,
    required this.stateOnPressed,
    required this.nameController,
    required this.buttonOnPressed,
  }) : super(key: key);

  final MyUserState state;
  final bool isEditing;
  final void Function()? stateOnPressed;
  final void Function() buttonOnPressed;
  final TextEditingController? nameController;

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
              child:
                  widget.isEditing ? _buildEditableText() : _buildFilledText(),
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

  Widget _buildEditableText() {
    return Column(
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
        ),
        ButtonDecorationWidget(
          onPressed: widget.buttonOnPressed,
          buttonTitle: updateButtonText,
        )
      ],
    );
  }

  Widget _buildFilledText() {
    return Column(
      children: [
        Padding(
          padding: textPadding,
          child: Text(
            profileTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: cardRadius),
            child: Center(
              child: Text(
                widget.state.user!.name,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ),
        Padding(
          padding: textPadding,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: cardRadius),
              child: Center(
                child: Text(
                  widget.state.user!.email,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ),
        )
      ],
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
          onPressed: widget.stateOnPressed,
        ),
      ],
    );
  }
}
