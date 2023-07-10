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
    apiKey: 'AIzaSyACKp_0T9j_T_j5GT_Tpq4au-H60YlQRio',
    appId: '1:250512036079:android:df6762ccbbaaac7a35cb1a',
    messagingSenderId: '250512036079',
    projectId: 'bloc-test-task',
    storageBucket: 'bloc-test-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXNB_B8WciHJk7aCnnd5MV023BEPeDqvI',
    appId: '1:250512036079:ios:2ff720346027573235cb1a',
    messagingSenderId: '250512036079',
    projectId: 'bloc-test-task',
    storageBucket: 'bloc-test-task.appspot.com',
    // androidClientId:
    //     '84340323405-246o89dk0ve81k3fs7m5m1bej3d4cir1.apps.googleusercontent.com',
    // iosClientId:
    //     '84340323405-7r14pcdc6544rnr4d70i5keca1d5833h.apps.googleusercontent.com',
    iosBundleId: 'com.example.blocTestTask',
  );
}
