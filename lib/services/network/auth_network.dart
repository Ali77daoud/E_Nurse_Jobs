import 'dart:convert';
import 'package:e_nurse_jobs/model/auth_models/register_model.dart';
import 'package:http/http.dart' as http;
import '../../model/auth_models/login_model.dart';
import '../../utils.dart/const_and_func.dart';

class AuthApi {
  //Sign up
  static Future<void> registerApi({
    required String userName,
    required String email,
    required String password,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Authenticate/register-admin');
    var response = await client.post(
      uri,
      body: jsonEncode(
          RegisterModel(email: email, password: password, userName: userName)
              .toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('register success');
    } else {
      print('register field');
      throw Exception('Sign Up failed');
    }
  }

  //login
  static Future<String> logInAPI({
    required String userName,
    required String password,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Authenticate/login');
    var response = await client.post(
      uri,
      body: jsonEncode(
        LoginModel(
          userName: userName,
          password: password,
        ).toJson(),
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('logIn success');
      final responseData = json.decode(response.body);
      return responseData['token'];
    } else {
      print('logIn field');
      throw Exception('LogIn failed');
    }
  }
}
