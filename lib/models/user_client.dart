class UserClient {
  late String _uid;
  late String _name;
  late String _lastName;
  late String _number;
  late List _favorites;
  late String _foto;
  late String _localization;
  late String _email;

  get getUid => this._uid;
  get getName => this._name;
  get getLastName => this._lastName;
  get getNumber => this._number;
  get getFavorites => this._favorites;
  get getFoto => this._foto;
  get getLocalization => this._localization;
  get getEmail => this._email;

  set setUid(n) => this._uid = n;
  set setName(n) => this._name = n;
  set setLastName(n) => this._lastName = n;
  set setNumber(n) => this._number = n;
  set setFavorites(n) => this._favorites = n;
  set setFoto(n) => this._foto = n;
  set setLocalization(n) => this._localization = n;
  set setEmail(n) => this._email = n;
}
