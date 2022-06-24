import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStg {
  FirebaseStg._();
  static final FirebaseStg _instance = FirebaseStg._();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  static FirebaseStorage get() {
    return FirebaseStg._instance._storage;
  }
}
