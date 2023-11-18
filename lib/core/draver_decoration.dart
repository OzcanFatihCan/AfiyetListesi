import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:afiyetlistesi/product/project_words.dart';
import 'package:flutter/material.dart';

class DrawerDecoration extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: PageColors.mainPageColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              profilName,
              overflow: TextOverflow.ellipsis,
              maxLines: PageItemSize.drawerLines,
              softWrap: true,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: PageColors.profilTextColor,
                    fontWeight: PageFont.cardTextFont,
                  ),
            ),
            accountEmail: Text(
              profilEmail,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: PageItemSize.drawerLines,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: PageColors.profilTextColor,
                    fontWeight: PageFont.cardTextFont,
                  ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
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
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(
                  image: AssetImage(ProjectWords.profilBannerUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: PageItemSize.listPaddingx,
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
                  drawerChoice: ProjectWords.drawerListItem[0],
                  onTap: () {},
                ),
                DrawerOptions(
                  drawerIcon: Icons.local_restaurant_rounded,
                  drawerChoice: ProjectWords.drawerListItem[1],
                  onTap: () {},
                ),
                DrawerOptions(
                  drawerIcon: Icons.favorite_rounded,
                  drawerChoice: ProjectWords.drawerListItem[2],
                  onTap: () {},
                ),
                DrawerOptions(
                  drawerIcon: Icons.settings_rounded,
                  drawerChoice: ProjectWords.drawerListItem[3],
                  onTap: () {},
                ),
                DrawerOptions(
                  drawerIcon: Icons.exit_to_app_rounded,
                  drawerChoice: ProjectWords.drawerListItem[4],
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({
    super.key,
    required this.drawerIcon,
    required this.drawerChoice,
    required this.onTap,
  });

  final IconData drawerIcon;
  final String drawerChoice;
  final void Function() onTap;

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
      color: PageColors.deactivedButtonColor,
      elevation: PageItemSize.elevationValueOff,
      child: ListTile(
        leading: Icon(drawerIcon, color: PageColors.profilTextColor),
        title: Text(
          drawerChoice,
          softWrap: true,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: PageColors.profilTextColor,
                fontWeight: PageFont.cardTextFont,
              ),
        ),
        onTap: onTap,
      ),
    );
  }
}
