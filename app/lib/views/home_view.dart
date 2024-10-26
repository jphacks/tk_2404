import 'package:app/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome, ${loginViewModel.firebaseState.user?.email ?? "User"}!',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final currentContext = context;

              await loginViewModel.logout();

              if (currentContext.mounted) {
                currentContext.go('/login');
              }
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
