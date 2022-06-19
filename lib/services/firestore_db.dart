import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB {
  FirestoreDB._();
  static final FirestoreDB _instance = FirestoreDB._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //retorna a instancia do firestore
  static FirebaseFirestore get() {
    return FirestoreDB._instance._firestore;
  }
}
