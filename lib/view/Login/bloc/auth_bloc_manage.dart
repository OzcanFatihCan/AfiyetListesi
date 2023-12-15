import 'package:afiyetlistesi/service/auth_service.dart';
import 'package:afiyetlistesi/view/Login/bloc/auth_event_manage.dart';
import 'package:afiyetlistesi/view/Login/bloc/auth_state_manage.dart';
import 'package:afiyetlistesi/view/Login/model/login_user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService = AuthService();

  AuthBloc() : super(AuthInitial());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInEvent) {
      yield AuthLoading();
      try {
        await authService.signInWithEmail(UserModel(
          userEmail: event.email,
          userPasw: event.password,
        ));
        yield AuthSuccess();
      } catch (error) {
        yield AuthFailure(error: error.toString());
      }
    }

    if (event is SignUpEvent) {
      yield AuthLoading();
      try {
        await authService.signUpWithEmail(UserModel(
          userEmail: event.email,
          userPasw: event.password,
        ));
        yield AuthSuccess();
      } catch (error) {
        yield AuthFailure(error: error.toString());
      }
    }

    if (event is SignOutEvent) {
      yield AuthLoading();
      try {
        await authService.signOut();
        yield AuthInitial();
      } catch (error) {
        yield AuthFailure(error: error.toString());
      }
    }
  }
}
