import 'package:app/utils.dart';
import 'package:app/view_model/signup_view_model.dart';
import 'package:app/widget/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  SignUpViewState createState() => SignUpViewState();
}

class SignUpViewState extends State<SignUpView> {
  final GlobalKey<ShadFormState> _formKey = GlobalKey<ShadFormState>();

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ShadForm(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'Music Walk',
                  style: ShadTheme.of(context).textTheme.h1,
                ),
              ),
              ShadInputFormField(
                  id: 'email',
                  controller: signUpViewModel.emailController,
                  placeholder: const Text('メールアドレス'),
                  prefix: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: ShadImage.square(size: 16, LucideIcons.mail),
                  ),
                  validator: (value) {
                    if (value.isEmpty && value != "") {
                      return 'メールアドレスを入力してください';
                    }

                    return validateEmail(value);
                  }),
              PasswordFormInput(
                controller: signUpViewModel.passwordController,
              ),
              PasswordFormInput(
                id: 'password_confirmation',
                placeholder: const Text('パスワード（確認用）'),
                controller: signUpViewModel.passwordConfirmationController,
                validator: (value) {
                  if (value.isEmpty && value == "") {
                    return 'パスワードを入力してください';
                  }

                  if (value != signUpViewModel.passwordController.text) {
                    return 'パスワードと確認用パスワードが一致しません';
                  }

                  return null;
                },
                withVisibility: false,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ShadButton(
                  onPressed: () async {
                    if (_formKey.currentState!.saveAndValidate()) {
                      final currentContext = context;
                      await signUpViewModel.signUp(
                        signUpViewModel.emailController.text,
                        signUpViewModel.passwordController.text,
                      );
                      if (currentContext.mounted &&
                          signUpViewModel.firebaseState.isAuthenticated) {
                        currentContext.go('/');
                      }
                    }
                  },
                  child: const Text('新規登録'),
                ),
              ),
              const SizedBox(height: 16),
              if (signUpViewModel.errorMessage.isNotEmpty)
                Text(
                  signUpViewModel.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ShadButton.secondary(
                  onPressed: () async {
                    context.go('/login');
                  },
                  child: const Text('すでに登録済みですか？'),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
