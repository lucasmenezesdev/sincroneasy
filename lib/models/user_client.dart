import 'package:flutter/cupertino.dart';
import 'package:sincroneasy/models/service.dart';
import 'package:sincroneasy/models/user.dart';

class UserClient extends ChangeNotifier implements User {
  @override
  late String uid;
  @override
  late String name;
  @override
  late String lastName;
  @override
  late String phone;
  @override
  late String email;
  late List favorites;
  late String foto;
  late String localization;
  late bool plan;
  late List<Service> services;

  get getUid => uid;
  get getName => name;
  get getLastName => lastName;
  get getPhone => phone;
  get getFavorites => favorites;
  get getFoto => foto;
  get getLocalization => localization;
  get getEmail => email;
  get getPlan => plan;

  set setUid(n) => uid = n;
  set setName(n) => name = n;
  set setLastName(n) => lastName = n;
  set setPhone(n) => phone = n;
  set setFavorites(n) => favorites = n;
  set setFoto(n) => foto = n;
  set setLocalization(n) => localization = n;
  set setEmail(n) => email = n;
  set setPlan(n) => plan = n;
}
