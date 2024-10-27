import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final int selectedIndex;
  final ValueChanged<int>? onItemTapped;

  const DefaultScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.selectedIndex = 0,
    this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.1))),
        child: BottomAppBar(
          color: Colors.black,
          // color: ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                color: selectedIndex == 0 ? Colors.deepPurple : Colors.grey,
                onPressed: () => onItemTapped?.call(0),
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                color: selectedIndex == 1 ? Colors.deepPurple : Colors.grey,
                onPressed: () => onItemTapped?.call(2),
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: selectedIndex == 2 ? Colors.deepPurple : Colors.grey,
                onPressed: () => onItemTapped?.call(3),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
