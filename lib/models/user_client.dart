class UserClient {
  late String _uid;
  late String _name;
  late String _lastName;
  late String _number;
  late List _favorites;
  late String _profileImage;
  late String _localization;
  late String _email;
  late bool _plan;

  get getUid => _uid;
  get getName => _name;
  get getLastName => _lastName;
  get getNumber => _number;
  get getFavorites => _favorites;
  get getFoto => _profileImage;
  get getLocalization => _localization;
  get getEmail => _email;
  get getPlan => _plan;

  set setUid(n) => _uid = n;
  set setName(n) => _name = n;
  set setLastName(n) => _lastName = n;
  set setNumber(n) => _number = n;
  set setFavorites(n) => _favorites = n;
  set setFoto(n) => _profileImage = n;
  set setLocalization(n) => _localization = n;
  set setEmail(n) => _email = n;
  set setPlan(n) => _plan = n;
}
