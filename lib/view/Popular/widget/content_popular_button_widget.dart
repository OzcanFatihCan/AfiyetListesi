part of '../page/popular_page.dart';

class _BuildContentButton extends StatefulWidget {
  const _BuildContentButton({
    Key? key,
    required Function(int) pageChange,
    required Function(int) contentChange,
    required ValueNotifier<int> currentPageNotifier,
  })  : _currentPageNotifier = currentPageNotifier,
        _pageChange = pageChange,
        _contentChange = contentChange,
        super(key: key);

  final Function(int) _pageChange;
  final Function(int) _contentChange;
  final ValueNotifier<int> _currentPageNotifier;

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
        child: ValueListenableBuilder(
            valueListenable: widget._currentPageNotifier,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: CategoryManager.instance.getCategoryTitles().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _ButtonWidget(
                        title:
                            CategoryManager.instance.getCategoryTitles()[index],
                        currentPageNotifier: widget._currentPageNotifier,
                        index: index,
                        onPressed: () {
                          widget._pageChange(index);
                          widget._contentChange(index);
                          widget._currentPageNotifier.value = index;
                        },
                      ),
                      Visibility(
                        visible: widget._currentPageNotifier.value == index,
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
              );
            }),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget with _pageSize, _pageWord {
  _ButtonWidget({
    Key? key,
    required String title,
    required Function()? onPressed,
    required final ValueNotifier<int> currentPageNotifier,
    required int index,
  })  : _title = title,
        _onPressed = onPressed,
        _currentPageNotifier = currentPageNotifier,
        _index = index,
        super(key: key);

  final String _title;
  final Function()? _onPressed;
  final ValueNotifier<int> _currentPageNotifier;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: elevationValueOff,
        backgroundColor: _currentPageNotifier.value == _index
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.surface,
      ),
      onPressed: _onPressed,
      child: Padding(
        padding: pagePaddingx,
        child: Text(
          _title,
          style: _currentPageNotifier.value == _index
              ? AppTheme().customTextTheme().labelLarge
              : Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
