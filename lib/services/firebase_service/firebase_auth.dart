import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quicksummary/resources/string_manager.dart';
import 'package:quicksummary/utils/snackbar.dart';

class AuthService {
  User? user;
  Stream<User?> get authState {
    return auth.authStateChanges();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  Future googleSignIn(BuildContext context) async {
    try {
      GoogleSignIn signIn = GoogleSignIn();
      GoogleSignInAccount? signInAccount =
          await signIn.signIn().catchError((error) {
        snackBar(error, context);
      });
      if (signInAccount != null) {
        GoogleSignInAuthentication signInAuthentication =
            await signInAccount.authentication;
        OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: signInAuthentication.accessToken,
            idToken: signInAuthentication.idToken);
        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
          user = userCredential.user;
          // ignore: use_build_context_synchronously
          snackBar(StringManager.successfully, context);
        } on FirebaseAuthException catch (e) {
          // ignore: use_build_context_synchronously
          snackBar(e.message!, context);
        }
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
    return user;
  }

  Future googleLogOut(BuildContext context) async {
    try {
      return await auth.signOut();
    } on FirebaseException catch (e) {
      snackBar(e.message!, context);
    }
  }
}
