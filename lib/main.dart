import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/layout.dart';
import 'package:sincroneasy/models/user_client.dart';
import 'package:sincroneasy/pages/initial.dart';
import 'package:sincroneasy/pages/login_page.dart';
import 'package:sincroneasy/services/auth_service.dart';
import 'package:sincroneasy/widgets/auth_check_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
      ChangeNotifierProvider(create: (context) => UserClient()),
    ],
    child: const MyApp(),
  ));
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
      home: Initial(),
    );
  }
}
