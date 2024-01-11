import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInAnonymous() async {
  final user = await FirebaseAuth.instance.signInAnonymously();
  return user;
}

Future<void> signInGoogle() async {
  if (kIsWeb) {
    final authProvider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
    final userCredentialWeb = await FirebaseAuth.instance.signInWithPopup(authProvider);
    debugPrint(userCredentialWeb.user?.email);
  } else {
    final googleSignIn = await GoogleSignIn().signIn();
    final googleAuth = await googleSignIn?.authentication;
    final googleCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
    debugPrint(userCredential.user?.email);
  }
}

Future<UserCredential> signInWithEmailPassword(String email, String password) async {
  final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  return user;
}
