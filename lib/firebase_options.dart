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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDDWiROHSL-EYhr4xcCKfjoyYpMaxZ1v9k',
    appId: '1:799321798808:web:bda8f1eee77baf198ff8ed',
    messagingSenderId: '799321798808',
    projectId: 'pintugarasi-432ed',
    authDomain: 'pintugarasi-432ed.firebaseapp.com',
    storageBucket: 'pintugarasi-432ed.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCLugTtxQpTeZf-Pi_IXnXJ4KAXm6lzyE',
    appId: '1:799321798808:android:917f920901d618cb8ff8ed',
    messagingSenderId: '799321798808',
    projectId: 'pintugarasi-432ed',
    storageBucket: 'pintugarasi-432ed.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDDWiROHSL-EYhr4xcCKfjoyYpMaxZ1v9k',
    appId: '1:799321798808:web:819524989006a00c8ff8ed',
    messagingSenderId: '799321798808',
    projectId: 'pintugarasi-432ed',
    authDomain: 'pintugarasi-432ed.firebaseapp.com',
    storageBucket: 'pintugarasi-432ed.appspot.com',
  );

}