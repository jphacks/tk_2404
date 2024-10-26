import 'package:app/view_model/firebase_state.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseState firebaseState; // FirebaseStateを保持するためのフィールド
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewModel(this.firebaseState); // コンストラクタでFirebaseStateを受け取る

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    await firebaseState.signIn(email, password);

    notifyListeners();
  }

  Future<void> logout() async {
    await firebaseState.signOut();
    notifyListeners();
  }
}
