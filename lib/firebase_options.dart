// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCLzor8iXyof8YAeGSDgoTRV9VXYevA4OM',
    appId: '1:398993777234:web:04ecd9d6c6564ecd11b58b',
    messagingSenderId: '398993777234',
    projectId: 'realestate-a8e8f',
    authDomain: 'realestate-a8e8f.firebaseapp.com',
    storageBucket: 'realestate-a8e8f.appspot.com',
    measurementId: 'G-68KJJTM7MS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWhA6q_qVkTHB8_au6Jabp_31HH1XNo0E',
    appId: '1:398993777234:android:2d54a740cdd797d111b58b',
    messagingSenderId: '398993777234',
    projectId: 'realestate-a8e8f',
    storageBucket: 'realestate-a8e8f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgPoqGXCnA3Dr1sMwsoxgwdJ-CkQ_auio',
    appId: '1:398993777234:ios:585a1e9b4ef2dda211b58b',
    messagingSenderId: '398993777234',
    projectId: 'realestate-a8e8f',
    storageBucket: 'realestate-a8e8f.appspot.com',
    iosBundleId: 'com.example.realEstate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgPoqGXCnA3Dr1sMwsoxgwdJ-CkQ_auio',
    appId: '1:398993777234:ios:585a1e9b4ef2dda211b58b',
    messagingSenderId: '398993777234',
    projectId: 'realestate-a8e8f',
    storageBucket: 'realestate-a8e8f.appspot.com',
    iosBundleId: 'com.example.realEstate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLzor8iXyof8YAeGSDgoTRV9VXYevA4OM',
    appId: '1:398993777234:web:31cf318d71d6a67511b58b',
    messagingSenderId: '398993777234',
    projectId: 'realestate-a8e8f',
    authDomain: 'realestate-a8e8f.firebaseapp.com',
    storageBucket: 'realestate-a8e8f.appspot.com',
    measurementId: 'G-WRRDR017P3',
  );
}