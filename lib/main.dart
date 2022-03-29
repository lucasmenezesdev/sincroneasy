import 'package:flutter/material.dart';
import 'package:sincroneasy/helpers/firebase_options.dart';
import 'package:sincroneasy/views/home_page.dart';
import 'package:sincroneasy/views/layout.dart';
import 'package:sincroneasy/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // final config = FirebaseConfig();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: config.apiKey,
  //     authDomain: config.authDomain,
  //     projectId: config.projectId,
  //     messagingSenderId: config.messagingSenderId,
  //     appId: config.appId,
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sincroneasy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Layout(),
    );
  }
}
