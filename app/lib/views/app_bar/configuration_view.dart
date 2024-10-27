import 'package:app/views/app_bar/home_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfigurationView extends StatelessWidget {
  const ConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            await launchUrl(authUrl);
          },
          child: const Text('Spotify 連携'),
        ),
      ],
    );
  }
}
