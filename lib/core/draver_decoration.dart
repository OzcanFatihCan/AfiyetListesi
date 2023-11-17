import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/font_set.dart';
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
              softWrap: true,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: PageColors.profilTextColor,
                fontWeight: PageFont.cardTextFont,
                shadows: [
                  Shadow(
                    color: Colors.red, // Gölge rengi
                    offset: Offset(2.0, 2.0), // Gölge konumu (x, y)
                    blurRadius: 3.0, // Gölge bulanıklığı
                  ),
                ],
              ),
            ),
            accountEmail: Text(
              profilEmail,
              softWrap: true,
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
          ListTile(
            leading: const Icon(Icons.assignment_add),
            title: const Text("Yemek ekle"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
