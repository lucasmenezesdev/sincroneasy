abstract class User {
  late String _uid;

  String get uid => _uid;

  set uid(String uid) {
    _uid = uid;
  }

  late String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  late String _lastName;

  String get lastName => _lastName;

  set lastName(String lastName) {
    _lastName = lastName;
  }

  late String _phone;

  String get phone => _phone;

  set phone(String phone) {
    _phone = phone;
  }

  late String _email;

  String get email => _email;

  set email(String email) {
    _email = email;
  }
}
