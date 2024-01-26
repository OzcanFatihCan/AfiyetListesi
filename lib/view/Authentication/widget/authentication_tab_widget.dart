part of '../page/authentication_page.dart';

class _BuildTabBar extends StatelessWidget with _pageSize, _pageWord {
  _BuildTabBar({required TabController tabController, Key? key})
      : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: tabBarPositionBot,
      left: tabBarSymetric,
      right: tabBarSymetric,
      child: Container(
        height: tabBarSize,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        child: TabBar(
          indicatorColor: Theme.of(context).colorScheme.secondary,
          indicatorWeight: indicatorWeight,
          controller: _tabController,
          tabs: [
            Padding(
              padding: textTabBarPadding,
              child: Text(
                loginTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  shadows: [
                    Shadow(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8),
                      offset: buttonOffset,
                      blurRadius: blur,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: textTabBarPadding,
              child: Text(
                registerTitle,
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(shadows: [
                  Shadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                    offset: buttonOffset,
                    blurRadius: blur,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
