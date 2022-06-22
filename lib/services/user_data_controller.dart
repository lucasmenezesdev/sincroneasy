import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sincroneasy/models/service.dart';
import 'package:sincroneasy/models/user_client.dart';
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
      final _snapshot =
          await _db.collection('consumers').doc(_authService.user?.uid).get();
      _currentUser.setName(_snapshot.get('name'));
      _currentUser.setLastName(_snapshot.get('lastname'));
      getUserFavorites();
    }
  }

  getUserFavorites() async {
    if (_authService.user?.uid != null) {
      final _snapshot = await _db
          .collection('consumers')
          .doc(_authService.user?.uid)
          .collection('favorites')
          .get();
      _snapshot.docs.forEach((document) {
        _favorites.add(document.data().values.toString());
      });
      _currentUser.setFavorites(_favorites);
    }
  }

  getUserServices() async {
    if (_authService.user?.uid != null) {
      final _snapshot = await _db
          .collection('consumers')
          .doc(_authService.user?.uid)
          .collection('services')
          .get();
      _snapshot.docs.forEach((document) {
        _favorites.add(document.data().values.toString());
      });
      _currentUser.setServices = _services;
    }
  }
}
