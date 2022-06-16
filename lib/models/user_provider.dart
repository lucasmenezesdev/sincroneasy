class UserClient {
  late String _uid;
  late String _name;
  late String _lastName;
  late String _number;
  late String _foto;
  late String _localization;
  late String _email;
  late String _job;
  late double _avaliation;
  late String _description;
  late int _called;
  //FALTAM OS MÉTODOS E O CONSTRUTOR
  get getUid => this._uid;
  get getName => this._name;
  get getLastName => this._lastName;
  get getNumber => this._number;
  get getFoto => this._foto;
  get getLocalization => this._localization;
  get getEmail => this._email;
  get getJob => this._job;
  get getAvaliation => this._avaliation;
  get getDescription => this._description;
  get getCalled => this._called;

  set setUid(n) => this._uid = n;
  set setName(n) => this._name = n;
  set setLastName(n) => this._lastName = n;
  set setNumber(n) => this._number = n;
  set setFoto(n) => this._foto = n;
  set setLocalization(n) => this._localization = n;
  set setEmail(n) => this._email = n;
  set setJob(n) => this._job = n;
  set setAvaliation(n) => this._avaliation = n;
  set setDescription(n) => this._description = n;
  set setCalled(n) => this._called = n;
}
