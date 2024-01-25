part of '../page/alternative_login_page.dart';

class _AlternativeOptions extends StatelessWidget with _pageSize {
  _AlternativeOptions({
    Key? key,
    required this.text,
    required this.logo,
    required this.onTap,
  }) : super(key: key);

  final Logo logo;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cardPadding,
      child: Card(
        shape: Theme.of(context).cardTheme.shape,
        color: Theme.of(context).cardTheme.color,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: logo,
          ),
          title: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
