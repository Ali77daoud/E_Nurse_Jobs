class LoginModel {
  final String userName;
  final String password;

  LoginModel({required this.password, required this.userName});

  Map<String, dynamic> toJson() {
    return {"userName": userName, "password": password};
  }
}
