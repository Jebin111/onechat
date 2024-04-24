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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAa2CRsjeD0plcO1ORP4qsz3dYPL7R2dqg',
    appId: '1:611343128060:web:d1d8afdfe7f634d1524e79',
    messagingSenderId: '611343128060',
    projectId: 'onechat-75fc0',
    authDomain: 'onechat-75fc0.firebaseapp.com',
    storageBucket: 'onechat-75fc0.appspot.com',
    measurementId: 'G-5H2GGNNBJP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRgCeIHTcR2TSKMwfRBVO16RLE0sbfWIs',
    appId: '1:611343128060:android:0a19e156474d8324524e79',
    messagingSenderId: '611343128060',
    projectId: 'onechat-75fc0',
    storageBucket: 'onechat-75fc0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMAlapzlhREo2k-Gi393lzM4ULGblsiXA',
    appId: '1:611343128060:ios:46262f845ca2b65c524e79',
    messagingSenderId: '611343128060',
    projectId: 'onechat-75fc0',
    storageBucket: 'onechat-75fc0.appspot.com',
    iosBundleId: 'com.example.onechat',
  );
}
