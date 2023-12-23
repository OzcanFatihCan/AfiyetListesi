part of '../page/food_add_page.dart';

class _BuildFoodAddCategory extends StatefulWidget {
  const _BuildFoodAddCategory();

  @override
  State<_BuildFoodAddCategory> createState() => _BuildFoodAddCategoryState();
}

class _BuildFoodAddCategoryState extends State<_BuildFoodAddCategory>
    with _pageSize, _pageWord {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          categoryTitle,
          style: Theme.of(context).textTheme.labelSmall,
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
          value: selectedCategory,
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue;
            });
          },
          items: <String>['Kategori 1', 'Kategori 2', 'Kategori 3', 'Diğer']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
