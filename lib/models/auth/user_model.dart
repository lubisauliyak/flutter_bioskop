class UserModel {
  final String email;
  final String token;
  final String refreshToken;
  final String message;

  UserModel({
    required this.email,
    required this.token,
    required this.refreshToken,
    this.message = 'message',
  });

  String? _name;
  set setName(String value) {
    _name = value;
  }

  String? get name => _name;
  String? _password;
  set setPassword(String value) {
    _password = value;
  }

  String? get password => _password;
}
