part of '../page/authentication_page.dart';

class _BuildAuthBar extends StatelessWidget with _pageWord, _pageSize {
  _BuildAuthBar({required TabController tabController, Key? key})
      : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: authBarPositionBot,
      left: authBarSymetric,
      right: authBarSymetric,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.42,
        child: Card(
          color: Theme.of(context).colorScheme.onBackground,
          child: TabBarView(
            controller: _tabController,
            children: [
              BlocProvider<SignInBloc>(
                create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
                child: const LoginPageView(),
              ),
              BlocProvider<SignUpBloc>(
                create: (context) => SignUpBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository,
                ),
                child: const RegisterPageView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
