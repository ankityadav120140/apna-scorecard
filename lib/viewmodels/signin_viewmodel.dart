import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  User? _user;
  User? get user => _user;

  Future<void> checkUserOnStartup() async {
    _user = _authService.currentUser;
    if (_user != null) {
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      _user = await _authService.signInWithGoogle();
      notifyListeners();
    } catch (e) {
      throw Exception('Sign-in failed: $e');
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  bool get isSignedIn => _user != null;
}
