import 'package:app/utils.dart';
import 'package:app/view_model/login_view_model.dart';
import 'package:app/widget/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ShadFormState> formKey = GlobalKey<ShadFormState>();
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              'Music Walk',
              style: ShadTheme.of(context).textTheme.h1,
            ),
          ),
          ShadForm(
            key: formKey,
            child: Column(
              children: [
                ShadInputFormField(
                  id: 'email',
                  controller: loginViewModel.emailController,
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
                  },
                  keyboardType: TextInputType.text,
                ),
                PasswordFormInput(
                  controller: loginViewModel.passwordController,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ShadButton(
                    onPressed: () async {
                      final currentContext = context; // Store context

                      await loginViewModel.login();
                      if (currentContext.mounted &&
                          loginViewModel.firebaseState.isAuthenticated) {
                        currentContext.go('/');
                      }
                    },
                    child: const Text('ログイン'),
                  ),
                ),
                const SizedBox(height: 16),
                if (loginViewModel.errorMessage.isNotEmpty)
                  Text(
                    loginViewModel.errorMessage,
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
                      context.go('/signup');
                    },
                    child: const Text('新規登録'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
