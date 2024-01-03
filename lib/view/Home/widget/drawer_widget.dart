part of '../page/home_page.dart';

class _BuildDrawerWidget extends StatefulWidget {
  const _BuildDrawerWidget({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

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
    return BlocBuilder<MyUserBloc, MyUserState>(
      builder: (context, state) {
        if (state.status == MyUserStatus.success) {
          return Drawer(
            backgroundColor: Theme.of(context).colorScheme.background,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: _buildDrawerText(
                    state.user!.name,
                    textLimitx,
                  ),
                  accountEmail: _buildDrawerText(
                    state.user!.email,
                    textLimit2x,
                  ),
                  currentAccountPicture:
                      _buildDrawerProfilPhoto(context, state),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    image: DecorationImage(
                      image:
                          AssetImage(ItemsofAsset.profilBannerUrl.fetchPhoto),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: listPadding2x,
                  child: Column(
                    children: [
                      Divider(
                        color: Theme.of(context).colorScheme.onPrimary,
                        thickness: thickness,
                      ),
                      SizedBox(
                        height: spaceObjects,
                      ),
                      _BuildDrawerOptions(
                        drawerIcon: Icons.assignment_add,
                        drawerChoice: ListItemName
                            .values[ListItemName.yemekEkle.index]
                            .getListTitle(),
                        onTap: () async {
                          await NavigatorManager.instance.pushToPage(
                              NavigateRoutes.foodAdd,
                              arguments: {'myUser': state.user!});
                          _updateSelectedOption(ListItemName.yemekEkle.index);
                        },
                        isSelected: _selectedOptionIndex ==
                            ListItemName.yemekEkle.index,
                      ),
                      _BuildDrawerOptions(
                        drawerIcon: Icons.local_restaurant_rounded,
                        drawerChoice: ListItemName
                            .values[ListItemName.yemeklerim.index]
                            .getListTitle(),
                        onTap: () async {
                          await NavigatorManager.instance
                              .pushToPage(NavigateRoutes.userFood);
                          _updateSelectedOption(ListItemName.yemeklerim.index);
                        },
                        isSelected: _selectedOptionIndex ==
                            ListItemName.yemeklerim.index,
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
                        isSelected: _selectedOptionIndex ==
                            ListItemName.favorilerim.index,
                      ),
                      _BuildDrawerOptions(
                        drawerIcon: Icons.settings_rounded,
                        drawerChoice: ListItemName
                            .values[ListItemName.ayarlar.index]
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
                        drawerChoice: ListItemName
                            .values[ListItemName.cikisYap.index]
                            .getListTitle(),
                        onTap: () {
                          _updateSelectedOption(ListItemName.cikisYap.index);
                          context
                              .read<SignInBloc>()
                              .add(const SignOutRequired());
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
        } else {
          return Center(
            child: Lottie.asset(
              ItemsofAsset.lottieLoading.fetchLottie,
            ),
          );
        }
      },
    );
  }

  DottedFrame _buildDrawerProfilPhoto(BuildContext context, MyUserState state) {
    return DottedFrame(
      child: ClipOval(
        child: GestureDetector(
          onTap: () {
            _pageChangeDrawer(PageName.profile.index);
            Navigator.pop(context);
          },
          child: state.user!.picture == ""
              ? Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    ItemsofAsset.profilPhotoUrl.fetchPhoto,
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                    state.user!.picture!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }

  Padding _buildDrawerText(
    String title,
    int limit,
  ) {
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
