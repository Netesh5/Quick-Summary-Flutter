import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quicksummary/resources/string_manager.dart';
import 'package:quicksummary/utils/snackbar.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future googleSignIn(BuildContext context) async {
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
        // ignore: use_build_context_synchronously
        snackBar(StringManager.successfully, context);
      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        snackBar(e.message!, context);
      }
    } else {
      return null;
    }
  }
}
