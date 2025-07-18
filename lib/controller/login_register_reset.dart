import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class LoginRegisterReset {
  Future<void> register({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> loginUsername({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> loginGoogle() {
    if (kIsWeb) {
      return _auth.signInWithPopup(GoogleAuthProvider());
    } else {
      return _auth.signInWithProvider(GoogleAuthProvider());
    }
  }

  Future<void> loginFacebook() {
    if (kIsWeb) {
      return _auth.signInWithPopup(FacebookAuthProvider());
    } else {
      return _auth.signInWithProvider(FacebookAuthProvider());
    }
  }

  Future<void> loginTwitter() {
    if (kIsWeb) {
      return _auth.signInWithPopup(TwitterAuthProvider());
    } else {
      return _auth.signInWithProvider(TwitterAuthProvider());
    }
  }

  Future<void> resetPass({required email}) {
    return _auth.sendPasswordResetEmail(email: email);
  }
}
