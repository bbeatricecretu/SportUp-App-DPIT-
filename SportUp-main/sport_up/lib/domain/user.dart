class User {
  late String _surname;
  late String _name;
  late String _email;
  late String _password;

  User(this._surname, this._name, this._email, this._password);

  String get surname => _surname;
  String get name => _name;
  String get email => _email;
  String get password => _password;

  set password(String newpass) {
    _password = newpass;
  }

  @override
  bool operator ==(other) {
    return (other is User) && other._email == _email;
  }
}
