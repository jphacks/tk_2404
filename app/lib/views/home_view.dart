import 'package:app/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

Uri buildSpotifyAuthUrl({
  required String clientId,
  required String scope,
  required String redirectUri,
  required String state,
}) {
  final Uri uri = Uri.https(
    'accounts.spotify.com',
    '/authorize',
    {
      'response_type': 'code',
      'client_id': clientId,
      'scope': scope,
      'redirect_uri': redirectUri,
      'state': state,
    },
  );

  return uri;
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    const String clientId = 'b3329c91ec944417b65b2baa5fda72be';
    const String scope = 'user-read-private user-read-email';
    const String redirectUri = 'net.hekuta://net.hekuta/spotify/callback';
    const String state = 'STATE';

    final Uri authUrl = buildSpotifyAuthUrl(
      clientId: clientId,
      scope: scope,
      redirectUri: redirectUri,
      state: state,
    );

    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: Column(
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
              ElevatedButton(
                onPressed: () async {
                  await launchUrl(authUrl);
                },
                child: const Text('Spotify 連携'),
              ),
            ],
          ),
        ));
  }
}
