import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _errorMessage = '';
  bool _isLoggedIn = false;
  User? _user; // Add this property to hold the user information

  String get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user; // Expose the user property

  LoginViewModel() {
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    _auth.authStateChanges().listen((User? user) {
      _user = user; // Update user property
      _isLoggedIn = user != null;
      notifyListeners();
    });
  }

  Future<void> login() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      _user = userCredential.user; // Set the user property
      _isLoggedIn = _user != null;
      _errorMessage = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'Wrong password provided for that user.';
      } else {
        _errorMessage = e.message ?? 'An unknown error occurred.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user = null; // Clear user information on logout
    _isLoggedIn = false;
    notifyListeners();
  }
}
