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
    apiKey: 'AIzaSyDIYXwy4-7zZ-jrFzsZ55NdWp1PNYy767I',
    appId: '1:724164953442:web:20696bcfee332f22ad983b',
    messagingSenderId: '724164953442',
    projectId: 'products-softro',
    authDomain: 'products-softro.firebaseapp.com',
    storageBucket: 'products-softro.appspot.com',
    measurementId: 'G-NHRNJPG0MW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRTmneqNr9wfOjJcAtR5OB72Zx1_zS910',
    appId: '1:724164953442:android:cdb45449c0452dfead983b',
    messagingSenderId: '724164953442',
    projectId: 'products-softro',
    storageBucket: 'products-softro.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrlXBcVE30M9gTqEfM30OZ67Hest7yPoE',
    appId: '1:724164953442:ios:e1177ff2c08dfc1dad983b',
    messagingSenderId: '724164953442',
    projectId: 'products-softro',
    storageBucket: 'products-softro.appspot.com',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrlXBcVE30M9gTqEfM30OZ67Hest7yPoE',
    appId: '1:724164953442:ios:bfe488cf6795866fad983b',
    messagingSenderId: '724164953442',
    projectId: 'products-softro',
    storageBucket: 'products-softro.appspot.com',
    iosBundleId: 'com.example.flutterApp.RunnerTests',
  );
}
