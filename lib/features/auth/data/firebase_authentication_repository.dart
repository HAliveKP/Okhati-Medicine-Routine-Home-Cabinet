import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../domain/repositories/authentication_repository.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  FirebaseAuthenticationRepository({FirebaseAuth? auth, GoogleSignIn? google})
    : _auth = auth ?? FirebaseAuth.instance,
      _google = google ?? GoogleSignIn.instance;

  final FirebaseAuth _auth;
  final GoogleSignIn _google;
  bool _googleInitialized = false;

  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);
      return true;
    } on FirebaseAuthException {
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> signInWithGoogle() async {
    try {
      if (!_googleInitialized) {
        await _google.initialize();
        _googleInitialized = true;
      }
      final account = await _google.authenticate();
      final tokens = account.authentication;
      final credential = GoogleAuthProvider.credential(idToken: tokens.idToken);
      await _auth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException {
      return false;
    } on GoogleSignInException {
      return false;
    } catch (_) {
      return false;
    }
  }
}
