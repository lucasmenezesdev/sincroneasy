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
  get getUid => _uid;
  get getName => _name;
  get getLastName => _lastName;
  get getNumber => _number;
  get getFoto => _foto;
  get getLocalization => _localization;
  get getEmail => _email;
  get getJob => _job;
  get getAvaliation => _avaliation;
  get getDescription => _description;
  get getCalled => _called;

  set setUid(n) => _uid = n;
  set setName(n) => _name = n;
  set setLastName(n) => _lastName = n;
  set setNumber(n) => _number = n;
  set setFoto(n) => _foto = n;
  set setLocalization(n) => _localization = n;
  set setEmail(n) => _email = n;
  set setJob(n) => _job = n;
  set setAvaliation(n) => _avaliation = n;
  set setDescription(n) => _description = n;
  set setCalled(n) => _called = n;
}
