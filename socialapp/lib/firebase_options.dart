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
    apiKey: 'AIzaSyAH47n8f_ccRLdEHYTDDXJAk2n0wZnghGo',
    appId: '1:347187365348:web:9beb0716dc1792839df3f1',
    messagingSenderId: '347187365348',
    projectId: 'social-app-92b54',
    authDomain: 'social-app-92b54.firebaseapp.com',
    storageBucket: 'social-app-92b54.appspot.com',
    measurementId: 'G-LBMDVYB1SC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAY7W2EgASaLyip0lccXUMoehUd3mBEvAg',
    appId: '1:347187365348:android:80464a03691d0e549df3f1',
    messagingSenderId: '347187365348',
    projectId: 'social-app-92b54',
    storageBucket: 'social-app-92b54.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGF1EYsW0M7HxzM-Uci2bc9ldQS2LW_rw',
    appId: '1:347187365348:ios:ceb0dd44265c3c2a9df3f1',
    messagingSenderId: '347187365348',
    projectId: 'social-app-92b54',
    storageBucket: 'social-app-92b54.appspot.com',
    iosBundleId: 'com.example.socialapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGF1EYsW0M7HxzM-Uci2bc9ldQS2LW_rw',
    appId: '1:347187365348:ios:0abfc305dbb688a69df3f1',
    messagingSenderId: '347187365348',
    projectId: 'social-app-92b54',
    storageBucket: 'social-app-92b54.appspot.com',
    iosBundleId: 'com.example.socialapp.RunnerTests',
  );
}