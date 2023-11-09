import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notion/utils/constants.dart';
import 'package:notion/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password; //isso aqui serve para receber as informações
  final auth = FirebaseAuth
      .instance; //aqui a gente usa a instancia do firebase para facilitar o processo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              //vamos pegar agora do arquivo constants.dart
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Entre seu email'),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              //vamos pegar agora do arquivo constants.dart
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Entre seu senha'),
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            RoundedButton(
                title: 'Login',
                color: Colors.blueAccent,
                onPressed: () {
                  auth
                      .signInWithEmailAndPassword(
                          email: email, password: password)
                      .then((value) => Navigator.pushNamed(context, '/main'));
                })
          ],
        ),
      ),
    );
  }
}
