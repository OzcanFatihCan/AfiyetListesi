part of '../page/authentication_page.dart';

abstract class StateManageAuthenticationPage extends State<AuthenticationPage>
    with TickerProviderStateMixin, _pageSize, _pageWord, _pageDuration {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }
}
