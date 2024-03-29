import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_repository/src/models/my_user.dart';

import 'entities/entities.dart';
import 'user_repo.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  //Auth Variables
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  //Stream get current User
  //Authentication status may change
  //If the user is not authenticated, the error messages appears
  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }

  // Sign Up
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);

      myUser = myUser.copyWith(
        id: user.user!.uid,
      );

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // Sign In
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // Sign out
  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // User Firebase Sign Up
  @override
  Future<void> setUserData(MyUser user) async {
    try {
      await usersCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // Reset Password
  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // User get
  @override
  Future<MyUser> getMyUser(String myUserId) async {
    try {
      return usersCollection.doc(myUserId).get().then(
            (value) => MyUser.fromEntity(
              MyUserEntity.fromDocument(value.data()!),
            ),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // User Photo Upload(update)
  @override
  Future<String> uploadPicture(String file, String userId) async {
    try {
      File imageFile = File(file);
      Reference firebaseStoreRef =
          FirebaseStorage.instance.ref().child('$userId/PP/${userId}_lead');
      await firebaseStoreRef.putFile(
        imageFile,
      );
      String url = await firebaseStoreRef.getDownloadURL();
      await usersCollection.doc(userId).update(
        {'picture': url},
      );
      return url;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //user info update
  @override
  Future<void> updateUserData(String name, String userId) async {
    try {
      await usersCollection.doc(userId).update({
        'name': name,
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  //google signIn
  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);

        final String? email = userCredential.user?.email;
        final String? name = userCredential.user?.displayName;

        final DocumentSnapshot data =
            await usersCollection.doc(userCredential.user!.uid).get();
        final docState = data.exists;

        log(docState.toString());

        if (docState == false) {
          if (email != null && name != null) {
            final MyUser newUser = MyUser(
              id: userCredential.user!.uid,
              email: email,
              name: name,
              picture: "",
            );
            await setUserData(newUser);
            return userCredential;
          } else {
            log("${user.toString()} not found");
          }
        } else {
          await getMyUser(userCredential.user!.uid);
        }

        return userCredential;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
