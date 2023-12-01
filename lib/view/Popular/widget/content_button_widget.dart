part of '../page/popular_page.dart';

class _BuildContentButton extends StatefulWidget {
  const _BuildContentButton();

  @override
  State<_BuildContentButton> createState() => _BuildContentButtonState();
}

class _BuildContentButtonState extends State<_BuildContentButton>
    with _pageSize, _pageWord {
  late int selectedButtonIndex;

  @override
  void initState() {
    super.initState();
    selectedButtonIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //kategoriler internetten çekildiğinde düzenlenecek.
      children: List.generate(contentButtonTitles.length, (index) {
        return Padding(
          padding: buttonPaddingx,
          child: _ButtonWidget(
            //buton isimleri yemek, turşu, içecek, reçel, tatlı,
            title: contentButtonTitles[index],
            onPressed: () {
              setState(() {
                selectedButtonIndex = index;
              });
            },
            isSelected: selectedButtonIndex == index,
          ),
        );
      }),
    );
  }
}

class _ButtonWidget extends StatelessWidget with _pageSize, _pageWord {
  _ButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isSelected = true,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: _FoodPageColors.headColor),
        shape: const StadiumBorder(),
        elevation: elevationValueOff,
        backgroundColor: isSelected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.surface,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: pagePaddingx,
        child: Text(
          title,
          style: isSelected
              ? AppTheme().customTextTheme().labelLarge
              : Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
