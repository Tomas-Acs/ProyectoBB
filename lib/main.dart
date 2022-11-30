
import 'package:firebase_auth/firebase_auth.dart';

import 'add.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'check.dart';
import 'mainpage.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "",
  //       authDomain: "",
  //       projectId: "",
  //       storageBucket: "",
  //       messagingSenderId: "",
  //       appId: "",
  //       measurementId: "",
  //     ),
  //   );
  // } else {
  await Firebase.initializeApp();
  // }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto de Software',
      home: Checklogin(),  //aqui va Home()
    );
  }
}


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final usuario = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Proyecto Bandera Blanca'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              // height: 50,
              // width: w,
              child: MaterialButton(
                color: Color.fromARGB(255, 2, 0, 133),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mainpage(),
                    ),
                  );
                },
                child: Text(
                  'Registros',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              // height: 50,
              // width: w,
              child: MaterialButton(
                color: Color.fromARGB(255, 2, 0, 133),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => add(),
                    ),
                  );
                },
                child: Text(
                  'Agregar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
            Center(
              child: Column(
                children: [
                  Image.asset('assets/images/Logo.png',height: 300,width: 300),
                  Text('En el sistema como: ' + usuario.email!),
                  SizedBox(height: 25),
                  MaterialButton(
                    color: Color.fromARGB(255, 2, 0, 133),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      'Salir',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}