import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sincroneasy/services/firestore_db.dart';

class AgendaController {
  final FirebaseFirestore _db = FirestoreDB.get();
  getImageProvider(String uidProvider) async {
    final snapshot = await _db.collection('providers').doc(uidProvider).get();
    String imageURL = snapshot.get('imageURL');
    return imageURL;
  }

  getNameProvider(String uidProvider) async {
    final snapshot = await _db.collection('providers').doc(uidProvider).get();
    String name = snapshot.get('name');
    return name;
  }
}
