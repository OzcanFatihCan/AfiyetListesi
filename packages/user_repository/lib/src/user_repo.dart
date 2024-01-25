import 'package:firebase_auth/firebase_auth.dart';

import '../user_repository.dart';

abstract class UserRepository {
  Future<void> signIn(String email, String password);

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<void> setUserData(MyUser user);

  Future<MyUser> getMyUser(String myUserId);

  Stream<User?> get user;

  Future<String> uploadPicture(String file, String userId);

  Future<void> updateUserData(String name, String userId);

  Future<UserCredential?> signInWithGoogle();
}
