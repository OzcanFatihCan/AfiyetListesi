part of '../page/food_page.dart';

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
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: CategoryName.values.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    widget._pageChange(index);
                    widget._contentChange(index);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: duration),
                    margin: contentButtonMargin,
                    width: contentButtonWidght,
                    height: contentButtonHeight,
                    decoration: BoxDecoration(
                      color: widget._currentFav == index
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.secondary,
                      borderRadius: widget._currentFav == index
                          ? buttonOnRadius
                          : buttonOffRadius,
                      border: widget._currentFav == index
                          ? Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                              width: cardLineThickness,
                            )
                          : null,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            CategoryName.values[index].getListTitle(),
                            style: widget._currentFav == index
                                ? Theme.of(context).textTheme.titleMedium
                                : Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
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
