import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/layout.dart';
import 'package:sincroneasy/models/user_client.dart';
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
      AuthService authService = Provider.of<AuthService>(context);
      UserClient currentUser = Provider.of<UserClient>(context);
      var db = FirestoreDB.get();
      getUserData() async {
        if (authService.user?.uid != null) {
          final snapshot =
              await db.collection('consumers').doc(authService.user?.uid).get();
          currentUser.setName(snapshot.get('name'));
          currentUser.setFoto(snapshot.get('foto'));
          currentUser.setLastName(snapshot.get('lastname'));
        }
      }

      getUserData();
      return Layout();
    }
  }
}
