part of '../page/food_add_page.dart';

// ignore: must_be_immutable
class _BuildFoodAddCategory extends StatefulWidget {
  const _BuildFoodAddCategory(
      {required String? selectedCategory,
      required Function(String?)? onChanged})
      : _selectedCategory = selectedCategory,
        _onChanged = onChanged;

  final String? _selectedCategory;

  final Function(String?)? _onChanged;
  @override
  State<_BuildFoodAddCategory> createState() => _BuildFoodAddCategoryState();
}

class _BuildFoodAddCategoryState extends State<_BuildFoodAddCategory>
    with _pageSize, _pageWord {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          categoryTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        DropdownButton<String>(
          icon: Icon(
            Icons.restaurant_menu_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          borderRadius: dropdownRadius,
          dropdownColor:
              Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
          style: Theme.of(context).textTheme.labelSmall,
          value: widget._selectedCategory,
          onChanged: widget._onChanged,
          items: CategoryManager.instance
              .getCategoryTitles()
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
