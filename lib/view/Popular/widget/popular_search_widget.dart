part of '../page/popular_page.dart';

class _PopularSearchWidget extends StatelessWidget with _pageSize {
  _PopularSearchWidget({
    required TextEditingController searchController,
    required ValueNotifier<int> currentPageNotifer,
  })  : _searchController = searchController,
        _currentPageNotifier = currentPageNotifer;

  final TextEditingController _searchController;
  final ValueNotifier<int> _currentPageNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: spaceObjectPadding,
      child: SearchTextField(
        controller: _searchController,
        onChanged: (value) {
          context.read<GetPopularBloc>().add(SearchPopular(query: value));
          _currentPageNotifier.value =
              CategoryManager.instance.getCategoryIndex(CategoryName.yemek);
        },
      ),
    );
  }
}
