import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: const [
          ListTile(
            title: Text("オーバーライド"),
            subtitle: Text("haru"),
            trailing: Text("10 minutes"),
            textColor: Colors.white,

            leading: const Icon(Icons.account_circle),
          ),
        Divider(
          height: 2,
          thickness: 0.5,
          color: Colors.blueGrey,
        ),
          ListTile(
            title: Text("青のすみか"),
            subtitle: Text("octo-uro"),
              trailing: Text("1 hours"),
              textColor:Colors.white,
            leading:const Icon(Icons.account_circle)
          ),
          Divider(
            height: 2,
            thickness: 0.5,
            color: Colors.blueGrey,
          ),
            ListTile(
              title: Text("元彼女のみなさまへ"),
              subtitle: Text("Mikuto"),
              trailing: Text("3 hours"),
              textColor: Colors.white,
              leading: const Icon(Icons.account_circle),
            ),
          Divider(
            height: 2,
            thickness: 0.5,
            color: Colors.blueGrey,
          )
        ]
        )
    );
  }
}


