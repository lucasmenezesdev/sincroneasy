import 'package:flutter/cupertino.dart';

class UserClient extends ChangeNotifier {
  late String _uid;
  late String _name;
  late String _lastName;
  late String _number;
  late List _favorites;
  late String _foto;
  late String _localization;
  late String _email;

  get getUid => _uid;
  get getName => _name;
  get getLastName => _lastName;
  get getNumber => _number;
  get getFavorites => _favorites;
  get getFoto => _foto;
  get getLocalization => _localization;
  get getEmail => _email;

  set setUid(n) => {
        _uid = n,
        ChangeNotifier(),
      };
  set setName(n) => {
        _name = n,
        ChangeNotifier(),
      };
  set setLastName(n) => {
        _lastName = n,
        ChangeNotifier(),
      };
  set setNumber(n) => {
        _number = n,
        ChangeNotifier(),
      };
  set setFavorites(n) => {
        _favorites = n,
        ChangeNotifier(),
      };
  set setFoto(n) => {
        _foto = n,
        ChangeNotifier(),
      };
  set setLocalization(n) => {
        _localization = n,
        ChangeNotifier(),
      };
  set setEmail(n) => {
        _email = n,
        ChangeNotifier,
      };
}
