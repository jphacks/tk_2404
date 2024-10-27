import 'package:app/view_model/firebase_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseState firebaseState;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  LoginViewModel(this.firebaseState);

  Future<void> login() async {
    _errorMessage = '';
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await firebaseState.signIn(email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        _errorMessage = 'ユーザー名または、パスワードが違います。';
      } else if (e.code == 'network-request-failed') {
        _errorMessage = 'ネットワークに接続できません。';
      } else {
        _errorMessage = e.message ?? '原因不明のエラーが発生しました。';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    }

    notifyListeners();
  }

  Future<void> logout() async {
    await firebaseState.signOut();
    notifyListeners();
  }
}
