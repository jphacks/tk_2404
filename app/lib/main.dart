import 'package:app/firebase_options.dart';
import 'package:app/routers.dart';
import 'package:app/view_model/firebase_state.dart';
import 'package:app/view_model/login_view_model.dart';
import 'package:app/view_model/shopify_callback_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseState()),
        ChangeNotifierProvider(
            create: (context) =>
                ShopifyCallbackState(context.read<FirebaseState>())),
        ChangeNotifierProvider(
            create: (context) => LoginViewModel(context.read<FirebaseState>())),
      ],
      child: MaterialApp.router(
        routerConfig: routers,
        theme: ThemeData.light().copyWith(
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
        darkTheme: ThemeData.dark().copyWith(
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
    );
  }
}
