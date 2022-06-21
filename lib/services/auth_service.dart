import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sincroneasy/models/user_client.dart';
import 'package:sincroneasy/services/firestore_db.dart';

class AuthService extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;
  late FirebaseFirestore db;

  AuthService() {
    //recebendo instancia do firestore
    db = FirestoreDB.get();
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      this.user = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  Future register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('Senha muito curta! Mínimo de 6 caracteres.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este e-mail já está cadastrado.');
      } else {
        throw AuthException(e.message.toString());
      }
    }
  }

  login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _getUser();
      print(user?.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e);
        throw AuthException('E-mail não encontrado!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta!');
      }
    }
  }

  //função para escrever os dados do usuario cadastrado no banco de dados
  writeUser(String name, String lastName, String email, String phone) async {
    try {
      /*basta colocar o nome do path e setar os dados, a mesma coisa é feita 
      para update e delete de dados*/
      await db.collection('consumers').doc(_auth.currentUser!.uid).set(
          {'name': name, 'lastname': lastName, 'email': email, 'phone': phone});
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future signInWithGoogle() async {
    try {
      await googleSignIn.signIn();
    } catch (e) {
      print('Erro');
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}
