part of '../page/popular_page.dart';

class _BuildContentButton extends StatefulWidget {
  const _BuildContentButton({
    Key? key,
    required int currentFav,
    required Function(int) pageChange,
    required Function(int) contentChange,
  })  : _currentFav = currentFav,
        _pageChange = pageChange,
        _contentChange = contentChange,
        super(key: key);

  final int _currentFav;
  final Function(int) _pageChange;
  final Function(int) _contentChange;

  @override
  State<_BuildContentButton> createState() => _BuildContentButtonState();
}

class _BuildContentButtonState extends State<_BuildContentButton>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: spaceObjectPaddingMin,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: CategoryManager.instance.getCategoryTitles().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                _ButtonWidget(
                  title: CategoryManager.instance.getCategoryTitles()[index],
                  currentFav: widget._currentFav,
                  index: index,
                  onPressed: () {
                    widget._pageChange(index);
                    widget._contentChange(index);
                  },
                ),
                Visibility(
                  visible: widget._currentFav == index,
                  child: Container(
                    width: optionDot,
                    height: optionDot,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget with _pageSize, _pageWord {
  _ButtonWidget({
    Key? key,
    required String title,
    required Function()? onPressed,
    required int currentFav,
    required int index,
  })  : _title = title,
        _onPressed = onPressed,
        _currentFav = currentFav,
        _index = index,
        super(key: key);

  final String _title;
  final Function()? _onPressed;
  final int _currentFav;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: elevationValueOff,
        backgroundColor: _currentFav == _index
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.surface,
      ),
      onPressed: _onPressed,
      child: Padding(
        padding: pagePaddingx,
        child: Text(
          _title,
          style: _currentFav == _index
              ? AppTheme().customTextTheme().labelLarge
              : Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
