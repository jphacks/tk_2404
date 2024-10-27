import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseState with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  bool _isLoading = true;

  String _errorMessage = '';

  FirebaseState() {
    _initAuth();
    _errorMessage = '';
  }

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  bool get isEmailVerified => _user?.emailVerified ?? false;
  String get errorMessage => _errorMessage;

  Future<void> _initAuth() async {
    await Firebase.initializeApp();

    _auth.authStateChanges().listen((User? user) {
      _user = user;
      _isLoading = false;
      _errorMessage = '';
      notifyListeners();
    });
  }

  Future<void> signIn(String email, String password) async {
    _isLoading = true;

    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      _errorMessage = '';
    } catch (e) {
      _isLoading = false;
      rethrow;
    }

    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    _isLoading = true;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      _errorMessage = '';
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    _isLoading = false;
    notifyListeners();
  }

  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }

  Future<User?> reloadUser() async {
    FirebaseAuth.instance.currentUser!.reload();
    _user = await _auth.currentUser;
    notifyListeners();
    return _user!;
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
