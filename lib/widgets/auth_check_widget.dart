import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/layout.dart';
import 'package:sincroneasy/repositories/user_client.dart';
import 'package:sincroneasy/pages/initial.dart';
import 'package:sincroneasy/pages/register_page.dart';
import 'package:sincroneasy/services/firestore_db.dart';

import '../pages/login_page.dart';
import '../services/auth_service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    loading() {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (auth.isLoading) {
      return loading();
    } else if (auth.user == null) {
      return Initial();
    } else {
      return Layout();
    }
  }
}
