import 'dart:convert';
import 'package:e_nurse_jobs/model/auth_models/register_model.dart';
import 'package:http/http.dart' as http;
import '../../model/app_models/get_nurses_model.dart';
import '../../utils.dart/const_and_func.dart';

class AppApi {
  //Sign up
  static Future<GetNursesModel> getNurseApi({
    required String token,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Nurses/GetAll');
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('getNurse success');
      final responseData = json.decode(response.body);
      return GetNursesModel.fromJson(responseData);
    } else {
      print('getNurse field');
      throw Exception('getNurse Data Failed');
    }
  }
}
