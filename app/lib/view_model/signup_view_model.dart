import 'package:app/view_model/firebase_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final FirebaseState firebaseState;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  SignUpViewModel(this.firebaseState);

  Future<void> signUp(String email, String password) async {
    try {
      await firebaseState.signUp(email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMessage = '貧弱なパスワードです';
      } else if (e.code == 'email-already-in-use') {
        _errorMessage = 'このメールアドレスは既に使用されています';
      } else {
        _errorMessage = e.message ?? '異常なエラーが発生しました';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    }
    notifyListeners();
  }
}
