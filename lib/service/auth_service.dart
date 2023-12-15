import 'package:afiyetlistesi/product/navigator/project_navigator_control.dart';
import 'package:afiyetlistesi/product/navigator/project_navigator_manager.dart';
import 'package:afiyetlistesi/view/Login/model/login_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IAuthService {
  Future<void> signInWithEmail(UserModel userModel);
  Future<void> signUpWithEmail(UserModel userModel);
  Future signOut();
}

class AuthService implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");

  // Firestore Kayıt işlemi
  Future<void> registerWithEmail(UserModel userModel) async {
    try {
      await _userCollection.doc().set({
        "email": userModel.userEmail,
        "name": userModel.userName,
        "password": userModel.userPasw,
      });
    } catch (e) {
      return print(e);
    }
  }

  // Authentication giriş
  @override
  Future<void> signUpWithEmail(UserModel userModel) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userModel.userEmail!,
        password: userModel.userPasw!,
      );
      if (userCredential.user != null) {
        registerWithEmail(UserModel(
          userEmail: userModel.userEmail,
          userName: userModel.userName,
          userPasw: userModel.userPasw,
        ));
      }
    } on FirebaseAuthException catch (e) {
      return print(e.message);
    }
  }

  @override
  Future<void> signInWithEmail(UserModel userModel) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: userModel.userEmail!,
        password: userModel.userPasw!,
      );
      if (userCredential.user != null) {
        await NavigatorManager.instance.pushToPage(NavigateRoutes.home);
      } else {
        return print("giriş sırasında hata yaptınız");
      }
    } on FirebaseAuthException catch (e) {
      return print(e.message);
    }
  }

  // Çıkış işlemi
  @override
  Future signOut() async {
    try {
      await _auth.signOut();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
