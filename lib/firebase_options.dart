// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAh6Th_tIoeL4WxaXMFCPSKuei0KA3GhRc',
    appId: '1:1059064637100:web:ae6d653309e622248ee109',
    messagingSenderId: '1059064637100',
    projectId: 'afiyetlistesi',
    authDomain: 'afiyetlistesi.firebaseapp.com',
    storageBucket: 'afiyetlistesi.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALUN2MdT31xQeGX2FVwHnhywLWyw10KEI',
    appId: '1:1059064637100:android:e7195c8429ba1acd8ee109',
    messagingSenderId: '1059064637100',
    projectId: 'afiyetlistesi',
    storageBucket: 'afiyetlistesi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBErBJOA8daa83ff6ws2gXPkyeheROpWD0',
    appId: '1:1059064637100:ios:a7d319573c7444f18ee109',
    messagingSenderId: '1059064637100',
    projectId: 'afiyetlistesi',
    storageBucket: 'afiyetlistesi.appspot.com',
    iosBundleId: 'com.example.afiyetlistesi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBErBJOA8daa83ff6ws2gXPkyeheROpWD0',
    appId: '1:1059064637100:ios:43bf9c91ba3304558ee109',
    messagingSenderId: '1059064637100',
    projectId: 'afiyetlistesi',
    storageBucket: 'afiyetlistesi.appspot.com',
    iosBundleId: 'com.example.afiyetlistesi.RunnerTests',
  );
}
