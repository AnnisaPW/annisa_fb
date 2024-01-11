import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
  final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  return user;
}
