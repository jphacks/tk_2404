import 'package:app/views/app_bar/configuration_view.dart';
import 'package:app/views/app_bar/home_view.dart';
import 'package:app/views/app_bar/notification_view.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
  int currentIndex = 0;

  final pages = [
    const HomeView(),
    NotificationView(),
    const ConfigurationView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.1))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'ホーム',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: '通知',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '設定',
              ),
            ],
            onTap: _onItemTapped,
            currentIndex: currentIndex,
          ),
        ),
      ),
    );
  }
}
