import 'package:app/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    // Automatically navigate if already logged in
    if (loginViewModel.isLoggedIn) {
      // Use a post-frame callback to navigate after the build is complete
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentContext = context; // Store context
        if (currentContext.mounted) {
          currentContext.go('/home');
        }
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: loginViewModel.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: loginViewModel.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final currentContext = context; // Store context

                await loginViewModel.login();
                if (currentContext.mounted && loginViewModel.isLoggedIn) {
                  currentContext.go('/home');
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            if (loginViewModel.errorMessage.isNotEmpty)
              Text(
                loginViewModel.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
