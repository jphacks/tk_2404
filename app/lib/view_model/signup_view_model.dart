import 'package:app/view_model/firebase_state.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final FirebaseState firebaseState;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  SignUpViewModel(this.firebaseState);

  Future<void> signUp(String email, String password) async {
    await firebaseState.signUp(email, password);
    notifyListeners();
  }
}
