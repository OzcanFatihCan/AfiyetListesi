import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } catch (e) {
        log(e.toString());
        emit(const SignInFailure());
      }
    });
    on<SignOutRequired>((event, emit) async {
      await _userRepository.logOut();
    });

    on<GoogleSignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        final userCredential = await _userRepository.signInWithGoogle();
        if (userCredential != null) {
          emit(SignInSuccess());
        } else {
          emit(const SignInFailure(message: "User not found"));
        }
      } catch (e) {
        log(e.toString());
        emit(
          SignInFailure(
            message: e.toString(),
          ),
        );
      }
    });
  }

  final UserRepository _userRepository;
}
