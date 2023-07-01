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
    apiKey: 'AIzaSyCd_sxMYYGQ6-gm3-p-vmhaNF9w_QzpfNo',
    appId: '1:614849185657:web:98c0e613dc0ced9fea11a8',
    messagingSenderId: '614849185657',
    projectId: 'cosmoapp-1964e',
    authDomain: 'cosmoapp-1964e.firebaseapp.com',
    storageBucket: 'cosmoapp-1964e.appspot.com',
    measurementId: 'G-Q8T54YCYJ4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4Kf5bmLkdTezXtpv6EPFdhY6TWuF46Gg',
    appId: '1:614849185657:android:b348407276e9d185ea11a8',
    messagingSenderId: '614849185657',
    projectId: 'cosmoapp-1964e',
    storageBucket: 'cosmoapp-1964e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPDP5dHxSTB-c9MlExHei34gPMgghWvos',
    appId: '1:614849185657:ios:b1f35b0d296b284fea11a8',
    messagingSenderId: '614849185657',
    projectId: 'cosmoapp-1964e',
    storageBucket: 'cosmoapp-1964e.appspot.com',
    iosClientId: '614849185657-j6don3kfk83odr5q09aarfcp54q7u5th.apps.googleusercontent.com',
    iosBundleId: 'com.example.cosmaticsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPDP5dHxSTB-c9MlExHei34gPMgghWvos',
    appId: '1:614849185657:ios:b1f35b0d296b284fea11a8',
    messagingSenderId: '614849185657',
    projectId: 'cosmoapp-1964e',
    storageBucket: 'cosmoapp-1964e.appspot.com',
    iosClientId: '614849185657-j6don3kfk83odr5q09aarfcp54q7u5th.apps.googleusercontent.com',
    iosBundleId: 'com.example.cosmaticsApp',
  );
}
