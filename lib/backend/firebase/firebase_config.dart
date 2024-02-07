import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBe74kdb9UFqJ1qzvy02xW6phXFBlreYuI",
            authDomain: "tradeyplus-44b3f.firebaseapp.com",
            projectId: "tradeyplus-44b3f",
            storageBucket: "tradeyplus-44b3f.appspot.com",
            messagingSenderId: "1091091236378",
            appId: "1:1091091236378:web:f009442c7f186eadcff3a3"));
  } else {
    await Firebase.initializeApp();
  }
}
