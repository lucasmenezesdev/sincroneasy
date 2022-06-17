import 'package:sincroneasy/models/service.dart';
import 'package:sincroneasy/models/user.dart';

class UserClient implements User {
  @override
  String uid;
  @override
  String name;
  @override
  String lastName;
  @override
  String number;
  @override
  String email;
  late List favorites;
  late String foto;
  late String localization;
  late bool plan;
  late List<Service> services;

  UserClient(
      {required this.uid,
      required this.name,
      required this.lastName,
      required this.number,
      required this.email});

  get getUid => uid;
  get getName => name;
  get getLastName => lastName;
  get getNumber => number;
  get getFavorites => favorites;
  get getFoto => foto;
  get getLocalization => localization;
  get getEmail => email;
  get getPlan => plan;

  set setUid(n) => uid = n;
  set setName(n) => name = n;
  set setLastName(n) => lastName = n;
  set setNumber(n) => number = n;
  set setFavorites(n) => favorites = n;
  set setFoto(n) => foto = n;
  set setLocalization(n) => localization = n;
  set setEmail(n) => email = n;
  set setPlan(n) => plan = n;
}
