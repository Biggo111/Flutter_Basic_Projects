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
    apiKey: 'AIzaSyDYqRRdEetiFtFNR27X1gwbuHaXIAWkAlI',
    appId: '1:899096991424:web:52f03b5358ba6ad5dcbf25',
    messagingSenderId: '899096991424',
    projectId: 'auth-testing-1d1bd',
    authDomain: 'auth-testing-1d1bd.firebaseapp.com',
    storageBucket: 'auth-testing-1d1bd.appspot.com',
    measurementId: 'G-T58B43JD13',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvMWbQbH-uPjQtrnWS2hy-XBOGPmFvL5g',
    appId: '1:899096991424:android:5021917baf6ae609dcbf25',
    messagingSenderId: '899096991424',
    projectId: 'auth-testing-1d1bd',
    storageBucket: 'auth-testing-1d1bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBW3kYdxm4e-MI-f0IaKQec-NZaYc4fCM8',
    appId: '1:899096991424:ios:594b8d909df89181dcbf25',
    messagingSenderId: '899096991424',
    projectId: 'auth-testing-1d1bd',
    storageBucket: 'auth-testing-1d1bd.appspot.com',
    androidClientId: '899096991424-nl248e6ide0ktkhln6bv805av4inuhjn.apps.googleusercontent.com',
    iosClientId: '899096991424-0t70j4s0ooag2tbbji77ektj5qkd24d3.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthenticationLoginSignup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBW3kYdxm4e-MI-f0IaKQec-NZaYc4fCM8',
    appId: '1:899096991424:ios:594b8d909df89181dcbf25',
    messagingSenderId: '899096991424',
    projectId: 'auth-testing-1d1bd',
    storageBucket: 'auth-testing-1d1bd.appspot.com',
    androidClientId: '899096991424-nl248e6ide0ktkhln6bv805av4inuhjn.apps.googleusercontent.com',
    iosClientId: '899096991424-0t70j4s0ooag2tbbji77ektj5qkd24d3.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthenticationLoginSignup',
  );
}
