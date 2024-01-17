part of '../page/user_food_page.dart';

class _BuildContentButton extends StatefulWidget {
  const _BuildContentButton({
    Key? key,
    required Function(int) pageChange,
    required Function(int) contentChange,
    required ValueNotifier<int> currentPageNotifier,
  })  : _pageChange = pageChange,
        _contentChange = contentChange,
        _currentPageNotifier = currentPageNotifier,
        super(key: key);

  final Function(int) _pageChange;
  final Function(int) _contentChange;
  final ValueNotifier<int> _currentPageNotifier;

  @override
  State<_BuildContentButton> createState() => __BuildContentButtonState();
}

class __BuildContentButtonState extends State<_BuildContentButton>
    with _pageSize {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentButtonPadding,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.09,
        child: ValueListenableBuilder(
          valueListenable: widget._currentPageNotifier,
          builder: (BuildContext context, int value, Widget? child) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: CategoryManager.instance.getCategoryTitles().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        widget._pageChange(index);
                        widget._contentChange(index);
                        widget._currentPageNotifier.value = index;
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: duration),
                        margin: contentButtonMargin,
                        width: contentButtonWidght,
                        height: contentButtonHeight,
                        decoration: BoxDecoration(
                          color: widget._currentPageNotifier.value == index
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.secondary,
                          borderRadius:
                              widget._currentPageNotifier.value == index
                                  ? buttonOnRadius
                                  : buttonOffRadius,
                          border: widget._currentPageNotifier.value == index
                              ? Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: cardLineThickness,
                                )
                              : null,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                CategoryManager.instance
                                    .getCategoryTitles()[index],
                                style: widget._currentPageNotifier.value ==
                                        index
                                    ? Theme.of(context).textTheme.titleMedium
                                    : Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
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
          },
        ),
      ),
    );
  }
}
