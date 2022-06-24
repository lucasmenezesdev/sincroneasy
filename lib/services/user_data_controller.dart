import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/models/service.dart';
import 'package:sincroneasy/repositories/user_client.dart';
import 'package:sincroneasy/services/auth_service.dart';
import 'package:sincroneasy/services/firestore_db.dart';

class UserDataController {
  late BuildContext _context;
  late AuthService _authService;
  late UserClient _currentUser;
  late List _favorites = [];
  late List<Service> _services = [];
  late FirebaseFirestore _db;

  UserDataController({required BuildContext context}) {
    _context = context;
    _authService = Provider.of<AuthService>(_context);
    _currentUser = Provider.of<UserClient>(_context);
    _db = FirestoreDB.get();
  }
  getUserData() async {
    if (_authService.user?.uid != null) {
      try {
        final _snapshot =
            await _db.collection('consumers').doc(_authService.user?.uid).get();
        _currentUser.setName(_snapshot.get('name'));
        _currentUser.setLastName(_snapshot.get('lastname'));
        _currentUser.setFoto(_snapshot.get('profile_image'));
        _currentUser.setPhone(_snapshot.get('phone'));
        _currentUser.setEmail(_snapshot.get('email'));
        _currentUser.setUid(_snapshot.id);

        getUserFavorites();
        getUserServices();
      } on FirebaseException catch (e) {
        print(e);
      }
    }
  }

  getUserFavorites() async {
    if (_authService.user?.uid != null) {
      try {
        final _snapshot = await _db
            .collection('consumers')
            .doc(_authService.user?.uid)
            .collection('favorites')
            .get();
        for (var document in _snapshot.docs) {
          _favorites.add(document.data().values);
        }
        _currentUser.setFavorites(_favorites);
      } on FirebaseException catch (e) {
        print(e);
      }
    }
  }

  getUserServices() async {
    if (_authService.user?.uid != null) {
      try {
        final _snapshot = await _db
            .collection('consumers')
            .doc(_authService.user?.uid)
            .collection('services')
            .get();
        for (var document in _snapshot.docs) {
          try {
            final _snapshot2 = await _db
                .collection('providers')
                .doc(document.get('providerUid'))
                .get();
            Service service = Service(
                providerUid: document.get('providerUid'),
                service: document.get('service'),
                date: document.get('date'),
                providerImage: _snapshot2.get('imageURL'),
                providerName: _snapshot2.get('name'));
            _services.add(service);
          } on FirebaseException catch (e) {
            print(e.message);
          }
        }
        _currentUser.setServices(_services);
      } on FirebaseException catch (e) {
        print(e.message);
      }
    }
  }
}
