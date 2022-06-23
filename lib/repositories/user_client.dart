import 'package:flutter/material.dart';
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
  get getServices => services;
  get getFoto => foto;
  get getLocalization => localization;
  get getEmail => email;
  get getPlan => plan;

  setUid(String uid) {
    this.uid = uid;
    notifyListeners();
  }

  setName(String name) {
    this.name = name;
    notifyListeners();
  }

  setLastName(String lastName) {
    this.lastName = lastName;
    notifyListeners();
  }

  setFoto(String foto) {
    this.foto = foto;
    notifyListeners();
  }

  setPhone(String phone) {
    this.phone = phone;
    notifyListeners();
  }

  setFavorites(List favorites) {
    this.favorites = favorites;
    notifyListeners();
  }

  setServices(List<Service> services) {
    this.services = services;
    notifyListeners();
  }

  setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  set setLocalization(n) => localization = n;
  set setPlan(n) => plan = n;
}
