import 'dart:convert';
import 'package:e_nurse_jobs/model/nurse_models/add_nurse_model.dart';
import 'package:e_nurse_jobs/model/nurse_models/edit_nurse_model.dart';
import 'package:http/http.dart' as http;
import '../../model/nurse_models/get_nurses_model.dart';
import '../../utils.dart/const_and_func.dart';

class NurseApi {
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

  ///////////////
  static Future<GetNursesDataModel> getNurseDetailsApi({
    required String token,
    required int id,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Nurses/GetDetails?id=$id');
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
      return GetNursesDataModel.fromJson(responseData['obj']);
    } else {
      print('getNurse field');
      throw Exception('getNurse Data Failed');
    }
  }

  ///////////////
  static Future<void> editNurseApi(
      {required String token,
      required String name,
      required String phone,
      required int id,
      required bool gender,
      required bool isResigned}) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Nurses/Edit/$id');
    var response = await client.post(
      uri,
      body: jsonEncode(EditNurseModel(
              id: id,
              name: name,
              phone: phone,
              gender: gender,
              isResigned: isResigned)
          .toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('editNurse success');
    } else {
      print('editNurse field');
      throw Exception('Edit Nurse Data Failed');
    }
  }

  ///////////////
  static Future<void> addNurseApi(
      {required String token,
      required String name,
      required String phone,
      required bool gender,
      required bool isResigned}) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Nurses/Create');
    var response = await client.post(
      uri,
      body: jsonEncode(AddNurseModel(
              name: name, phone: phone, gender: gender, isResigned: isResigned)
          .toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Add Nurse success');
    } else {
      print('Add Nurse field');
      throw Exception('Add Nurse Failed');
    }
  }
}
