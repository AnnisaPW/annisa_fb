import 'package:annisa_fb/app/app.dart';
import 'package:annisa_fb/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // initStreamUser();
  runApp(const App());
}

// Stream<User?> userStream = Stream.value(null);

// initStreamUser() async* {
//   userStream.listen((user) {
//     FirebaseAuth.instance.authStateChanges().listen((event) {
//       user = event;
//     });
//   });
// }
