import 'package:app/view_model/login_view_model.dart';
import 'package:app/widget/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // LoginViewModelを取得
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 56,
            child: ShadInput(
              controller: loginViewModel.emailController,
              placeholder: const Text('メールアドレス'),
              prefix: const Padding(
                padding: EdgeInsets.all(4.0),
                child: ShadImage.square(size: 16, LucideIcons.mail),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 56,
            child: PasswordInput(
              controller: loginViewModel.passwordController,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ShadButton.secondary(
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
          if (loginViewModel.firebaseState.errorMessage.isNotEmpty)
            Text(
              loginViewModel.firebaseState.errorMessage,
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
                final currentContext = context; // Store context

                await loginViewModel.login();
                if (currentContext.mounted &&
                    loginViewModel.firebaseState.isAuthenticated) {
                  currentContext.go('/');
                }
              },
              child: const Text('新規登録'),
            ),
          ),
        ],
      ),
    );
  }
}
