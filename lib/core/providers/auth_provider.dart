import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  bool get isAuthenticated => _user != null;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  AuthProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password) async {
    _errorMessage = null;
    notifyListeners();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = switch (e.code) {
        'INVALID_LOGIN_CREDENTIALS' => 'Invalid login credentials.',
        'user-not-found' => 'No account found with that email.',
        'wrong-password' => 'password/username invalid.',
        'invalid-password' => 'password/username invalid.',
        _ => e.message ?? 'An error occurred.',
      };
      notifyListeners();
    }
  }

  Future<void> signUp(String email, String password) async {
    _errorMessage = null;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = switch (e.code) {
        'weak-password' => 'The password provided is too weak.',
        'email-already-in-use' => 'An account already exists with that email.',
        'email-already-exists' => 'An account already exists with that email.',
        _ => e.message ?? 'An error occurred.',
      };
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _errorMessage = null;
    try {
      await FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
