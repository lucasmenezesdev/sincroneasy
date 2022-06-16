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
<<<<<<< HEAD
  get getFoto => _profileImage;
  get getLocalization => _localization;
  get getEmail => _email;
  get getPlan => _plan;
=======
  get getFoto => _foto;
  get getLocalization => _localization;
  get getEmail => _email;
>>>>>>> 73db8d570ea75e9bf1e084fdc5bd6851538b2229

  set setUid(n) => _uid = n;
  set setName(n) => _name = n;
  set setLastName(n) => _lastName = n;
  set setNumber(n) => _number = n;
  set setFavorites(n) => _favorites = n;
<<<<<<< HEAD
  set setFoto(n) => _profileImage = n;
  set setLocalization(n) => _localization = n;
  set setEmail(n) => _email = n;
  set setPlan(n) => _plan = n;
=======
  set setFoto(n) => _foto = n;
  set setLocalization(n) => _localization = n;
  set setEmail(n) => _email = n;
>>>>>>> 73db8d570ea75e9bf1e084fdc5bd6851538b2229
}
