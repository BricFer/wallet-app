import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/service/user_service.dart';

class AuthProvider extends ChangeNotifier {
  User? firebaseUser;
  bool? hasBackendProfile;
  int? userId;
  String? fullname;
  String? username;
  bool get isAuthenticated => firebaseUser != null;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final UserService _userService = UserService();

  AuthProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) async {
      firebaseUser = user;

      if (user != null) {
        await user.getIdToken(true);
        await checkBackendProfile();
      } else {
        hasBackendProfile = null;
        userId = null;
      }
      notifyListeners();
    });
  }

  Future<void> checkBackendProfile() async {
    if (firebaseUser == null) return;

    try {
      final response = await _userService.getUserInfo();

      hasBackendProfile = response != null;
      userId = response?.userId;
      fullname = response?.fullname;
      username = response?.username;
    } catch (e) {
      hasBackendProfile = false;
    }
    notifyListeners();
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

  Future<void> updateUserPassword(String newPassword) async {
    _errorMessage = null;

    try {
      await firebaseUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      _errorMessage = switch (e.code) {
        'weak-password' => 'The password provided is too weak.',
        _ => e.message ?? 'An error occurred.',
      };
      notifyListeners();
    }
  }

  Future<void> deleteAccount() async {
    if (firebaseUser == null || userId == null) return;

    _errorMessage = null;

    try {
      await _userService.deleteUser(userId!);
      await firebaseUser!.delete();

      firebaseUser = null;
      hasBackendProfile = null;
      userId = null;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? 'No se pudo eliminar la cuenta de Firebase.';
      notifyListeners();
    } catch (e) {
      _errorMessage = 'No se pudo eliminar la cuenta.';
      notifyListeners();
    }
  }
}
