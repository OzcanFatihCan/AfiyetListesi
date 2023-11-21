import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class DrawerDecoration extends StatefulWidget {
  final String profilName;
  final String profilEmail;
  final String imageUrl;

  const DrawerDecoration({
    Key? key,
    required this.profilName,
    required this.profilEmail,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<DrawerDecoration> createState() => _DrawerDecorationState();
}

class _DrawerDecorationState extends State<DrawerDecoration> {
  int selectedOptionIndex = -1;

  void _updateSelectedOption(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PageColors.mainPageColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const DrawerText(
              title: ProjectWords.profilName,
              limit: PageItemSize.textLimitx,
            ),
            accountEmail: const DrawerText(
              title: ProjectWords.profilEmail,
              limit: PageItemSize.textLimit2x,
            ),
            currentAccountPicture: Card(
              shape: const CircleBorder(
                side: BorderSide(
                  color: PageColors.activeIconColor,
                  width: PageItemSize.textFieldBorderSize,
                ),
              ),
              child: CircleAvatar(
                child: ClipOval(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: widget.imageUrl.isNotEmpty
                        ? Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(
                  image: AssetImage(ProjectWords.profilBannerUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: PageItemSize.listPadding2x,
            child: Column(
              children: [
                const Divider(
                  color: PageColors.profilTextColor,
                ),
                const SizedBox(
                  height: PageItemSize.spaceObjects,
                ),
                DrawerOptions(
                  drawerIcon: Icons.assignment_add,
                  drawerChoice: ProjectWords
                      .drawerListItem[_ListItemName.yemekEkle.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.yemekEkle.index);
                  },
                  isSelected:
                      selectedOptionIndex == _ListItemName.yemekEkle.index,
                ),
                DrawerOptions(
                  drawerIcon: Icons.local_restaurant_rounded,
                  drawerChoice: ProjectWords
                      .drawerListItem[_ListItemName.yemeklerim.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.yemeklerim.index);
                  },
                  isSelected:
                      selectedOptionIndex == _ListItemName.yemeklerim.index,
                ),
                DrawerOptions(
                  drawerIcon: Icons.favorite_rounded,
                  drawerChoice: ProjectWords
                      .drawerListItem[_ListItemName.favorilerim.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.favorilerim.index);
                  },
                  isSelected:
                      selectedOptionIndex == _ListItemName.favorilerim.index,
                ),
                DrawerOptions(
                  drawerIcon: Icons.settings_rounded,
                  drawerChoice:
                      ProjectWords.drawerListItem[_ListItemName.ayarlar.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.ayarlar.index);
                  },
                  isSelected:
                      selectedOptionIndex == _ListItemName.ayarlar.index,
                ),
                DrawerOptions(
                  drawerIcon: Icons.exit_to_app_rounded,
                  drawerChoice:
                      ProjectWords.drawerListItem[_ListItemName.cikisYap.index],
                  onTap: () {
                    _updateSelectedOption(_ListItemName.cikisYap.index);
                  },
                  isSelected:
                      selectedOptionIndex == _ListItemName.cikisYap.index,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerText extends StatelessWidget {
  final String title;
  final int limit;

  const DrawerText({
    Key? key,
    required this.title,
    required this.limit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PageItemSize.listPaddingx,
      child: Text(
        title.length <= limit ? title : '${title.substring(0, limit)}...',
        overflow: TextOverflow.ellipsis,
        maxLines: PageItemSize.drawerLines,
        softWrap: true,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: PageColors.profilTextColor,
              fontWeight: PageFont.textFont,
            ),
      ),
    );
  }
}

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({
    Key? key,
    required this.drawerIcon,
    required this.drawerChoice,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final IconData drawerIcon;
  final String drawerChoice;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: PageColors.cardColor,
          width: PageItemSize.textFieldBorderSize,
        ),
        borderRadius: BorderRadius.all(
          PageItemSize.halfRadius(),
        ),
      ),
      color: isSelected
          ? PageColors.activeButtonColor2
          : PageColors.deactivedButtonColor,
      elevation: PageItemSize.elevationValueOff,
      child: ListTile(
        leading: Icon(drawerIcon, color: PageColors.profilTextColor),
        title: Text(
          drawerChoice,
          softWrap: true,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: PageColors.profilTextColor,
                fontWeight: PageFont.textFont,
              ),
        ),
        onTap: onTap,
      ),
    );
  }
}

enum _ListItemName { yemekEkle, yemeklerim, favorilerim, ayarlar, cikisYap }
