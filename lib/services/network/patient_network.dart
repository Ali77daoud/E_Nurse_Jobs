import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/patient_model/get_patient_model.dart';
import '../../utils.dart/const_and_func.dart';

class PatientApi {
  static Future<GetPatientModel> getPatientApi({
    required String token,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Patient/GetAll');
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('get Patient success');
      final responseData = json.decode(response.body);
      return GetPatientModel.fromJson(responseData);
    } else {
      print('get Patient field');
      throw Exception('get Patient Data Failed');
    }
  }

  // ///////////////
  static Future<GetPatienDataModel> getPatienDetailsApi({
    required String token,
    required int id,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Patient/GetDetails?id=$id');
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('get Patien success');
      final responseData = json.decode(response.body);
      return GetPatienDataModel.fromJson(responseData['obj']);
    } else {
      print('get Patien field');
      throw Exception('Get Patien Data Failed');
    }
  }

  // ///////////////
  // static Future<void> editNurseApi(
  //     {required String token,
  //     required String name,
  //     required String phone,
  //     required int id,
  //     required bool gender,
  //     required bool isResigned}) async {
  //   final client = http.Client();
  //   final uri = Uri.parse('$baseUrl/Nurses/Edit/$id');
  //   var response = await client.post(
  //     uri,
  //     body: jsonEncode(EditNurseModel(
  //             id: id,
  //             name: name,
  //             phone: phone,
  //             gender: gender,
  //             isResigned: isResigned)
  //         .toJson()),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //   );

  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     print('editNurse success');
  //   } else {
  //     print('editNurse field');
  //     throw Exception('Edit Nurse Data Failed');
  //   }
  // }

  // ///////////////
  // static Future<void> addNurseApi(
  //     {required String token,
  //     required String name,
  //     required String phone,
  //     required bool gender,
  //     required bool isResigned}) async {
  //   final client = http.Client();
  //   final uri = Uri.parse('$baseUrl/Nurses/Create');
  //   var response = await client.post(
  //     uri,
  //     body: jsonEncode(AddNurseModel(
  //             name: name, phone: phone, gender: gender, isResigned: isResigned)
  //         .toJson()),
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //   );

  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     print('Add Nurse success');
  //   } else {
  //     print('Add Nurse field');
  //     throw Exception('Add Nurse Failed');
  //   }
  // }
}
