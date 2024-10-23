import 'package:app/firebase_options.dart';
import 'package:app/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routers,
      theme: ThemeData.light().copyWith(
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      darkTheme: ThemeData.dark().copyWith(
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
    );
  }
}
