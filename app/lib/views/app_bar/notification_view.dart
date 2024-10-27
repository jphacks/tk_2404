import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music List'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("オーバーライド"),
            subtitle: Text("haru"),
          ),
        ListTile(
          title: Text("青のすみか"),
          subtitle: Text("octo-uro"),
        ),
          ListTile(
            title: Text("元彼女のみなさまへ"),
            subtitle: Text("Mikuto"),
          )
        ]
        )
    );
  }
}
