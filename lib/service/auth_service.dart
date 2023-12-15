import 'package:afiyetlistesi/view/Login/model/login_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IAuthService {
  Future<void> registerWithEmail(UserModel userModel);
  Future signInWithEmail(String email, String password);
  Future signOut();
}

class AuthService implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userCollection = FirebaseFirestore.instance.collection("users");

  // Kayıt işlemi
  @override
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

  // Giriş işlemi
  @override
  Future signInWithEmail(String email, String password) async {}

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
