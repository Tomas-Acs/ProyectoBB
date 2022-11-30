import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/auth_page.dart';
import 'package:proyectofinal/login_page.dart';
import 'package:proyectofinal/main.dart';

class Checklogin extends StatefulWidget {
  const Checklogin({Key? key}) : super(key: key);

  @override
  State<Checklogin> createState() => _CheckloginState();
}

class _CheckloginState extends State<Checklogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return Home();
          } else {
            return AuthPage(); //LoginPage
          }
        },
      ),
    );
  }
}
