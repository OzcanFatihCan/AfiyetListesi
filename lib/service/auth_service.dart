import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IAuthService {
  Future registerWithEmail(String email, String password, String name);
  Future signInWithEmail(String email, String password);
  Future signOut();
}

class AuthService implements IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kayıt işlemi
  @override
  Future registerWithEmail(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = result.user?.uid ?? "";

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
      });

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  // Giriş işlemi
  @override
  Future signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return null;
    } catch (e) {
      return e.toString();
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
