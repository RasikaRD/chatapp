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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD453F_Gku66KaeTUZd_W0ZocO8ngcsuGk',
    appId: '1:363931493864:android:7b962c51370de18030f05d',
    messagingSenderId: '363931493864',
    projectId: 'chat-app-4fdc1',
    databaseURL: 'https://chat-app-4fdc1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chat-app-4fdc1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDn4-gPfuoOyCIPsYFvf08OEq_HCyMBZiA',
    appId: '1:363931493864:ios:6440cd7dd8edcbd330f05d',
    messagingSenderId: '363931493864',
    projectId: 'chat-app-4fdc1',
    databaseURL: 'https://chat-app-4fdc1-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chat-app-4fdc1.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );
}