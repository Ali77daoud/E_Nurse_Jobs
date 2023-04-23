class RegisterModel {
  final String userName;
  final String email;
  final String password;

  RegisterModel(
      {required this.password, required this.email, required this.userName});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'userName': userName,
    };
  }
}
