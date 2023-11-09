import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notion/screens/register_screen.dart';
import 'package:notion/screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyC68d_6qj4YPVuLEbeokQxqeVr_k9OFEjM",
              appId: "1:286553667983:android:22f77a8256e3eff46cf3fa",
              messagingSenderId:
                  "1:286553667983:android:22f77a8256e3eff46cf3fa",
              projectId: "notion-759c1")),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => const WelcomeScreen(),
              '/register': (context) => const RegisterScreen(),
              //'/main': (context) => const MainScree()
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
