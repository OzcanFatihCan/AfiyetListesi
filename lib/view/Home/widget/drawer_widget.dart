part of '../page/home_page.dart';

class _BuildDrawerWidget extends StatefulWidget {
  final String profilName;
  final String profilEmail;
  final String imageUrl;
  final PageController _pageController;

  const _BuildDrawerWidget({
    Key? key,
    required this.profilName,
    required this.profilEmail,
    required this.imageUrl,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  @override
  State<_BuildDrawerWidget> createState() => _BuildDrawerWidgetState();
}

class _BuildDrawerWidgetState extends State<_BuildDrawerWidget>
    with _pageSize, _pageDuration {
  int _selectedOptionIndex = -1;
  void _updateSelectedOption(int index) {
    setState(() {
      _selectedOptionIndex = index;
    });
  }

  void _pageChangeDrawer(int index) {
    setState(
      () {
        widget._pageController.animateToPage(
          index,
          duration: Duration(seconds: duration),
          curve: Curves.decelerate,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: _buildDrawerText(
              widget.profilName,
              textLimitx,
            ),
            accountEmail: _buildDrawerText(
              widget.profilEmail,
              textLimit2x,
            ),
            currentAccountPicture: _buildDrawerPhoto(context),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              image: const DecorationImage(
                  image: AssetImage(ProjectPhotos.profilBannerUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: listPadding2x,
            child: Column(
              children: [
                Divider(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                SizedBox(
                  height: spaceObjects,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.assignment_add,
                  drawerChoice: ListItemName
                      .values[ListItemName.yemekEkle.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.yemekEkle.index);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.yemekEkle.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.local_restaurant_rounded,
                  drawerChoice: ListItemName
                      .values[ListItemName.yemeklerim.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.yemeklerim.index);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.yemeklerim.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.favorite_rounded,
                  drawerChoice: ListItemName
                      .values[ListItemName.favorilerim.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.favorilerim.index);
                    _pageChangeDrawer(PageName.favorite.index);
                    Navigator.pop(context);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.favorilerim.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.settings_rounded,
                  drawerChoice: ListItemName.values[ListItemName.ayarlar.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.ayarlar.index);
                    _pageChangeDrawer(PageName.profile.index);
                    Navigator.pop(context);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.ayarlar.index,
                ),
                _BuildDrawerOptions(
                  drawerIcon: Icons.exit_to_app_rounded,
                  drawerChoice: ListItemName.values[ListItemName.cikisYap.index]
                      .getListTitle(),
                  onTap: () {
                    _updateSelectedOption(ListItemName.cikisYap.index);
                  },
                  isSelected:
                      _selectedOptionIndex == ListItemName.cikisYap.index,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar _buildDrawerPhoto(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: DottedFrame(
        child: ClipOval(
          child: AspectRatio(
            aspectRatio: aspectValue,
            child: InkWell(
              onTap: () {
                _pageChangeDrawer(PageName.profile.index);
                Navigator.pop(context);
              },
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
                  : Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          backgroundImage: const AssetImage(
                            ProjectPhotos.profilPhotoUpdateUrl,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildDrawerText(String title, int limit) {
    return Padding(
      padding: listPaddingx,
      child: Text(
        title.length <= limit ? title : '${title.substring(0, limit)}...',
        overflow: TextOverflow.ellipsis,
        maxLines: drawerLines,
        softWrap: true,
        style: AppTheme().customTextTheme().titleSmall,
      ),
    );
  }
}

class _BuildDrawerOptions extends StatelessWidget with _pageSize {
  _BuildDrawerOptions({
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
      shape: AppTheme().customCardTheme().shape,
      color: Theme.of(context).cardTheme.color,
      elevation: elevationValueOff,
      child: ListTile(
        leading: Icon(
          drawerIcon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          drawerChoice,
          softWrap: true,
          style: AppTheme().customTextTheme().titleLarge,
        ),
        onTap: onTap,
      ),
    );
  }
}
