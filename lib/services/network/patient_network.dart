import 'dart:convert';
import 'package:e_nurse_jobs/model/patient_model/add_patient.dart';
import 'package:http/http.dart' as http;
import '../../model/patient_model/edit_patient_model.dart';
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
  static Future<void> editPatientApi(
      {required String token,
      required int id,
      required String name,
      required String roomPhoto,
      required bool isStopped}) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Patient/Edit/$id');
    var response = await client.post(
      uri,
      body: jsonEncode(EditPatientModel(
              id: id, name: name, roomPhoto: roomPhoto, isStoped: isStopped)
          .toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('edit Patien success');
    } else {
      print('edit Patien field');
      throw Exception('Edit Patien Data Failed');
    }
  }

  // ///////////////
  static Future<void> addPatientApi(
      {required String token,
      required String name,
      required String roomPhoto,
      required bool isStopped}) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Patient/Create');
    var response = await client.post(
      uri,
      body: jsonEncode(
          AddPatientModel(name: name, isStoped: isStopped, roomPhoto: roomPhoto)
              .toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Add Patien success');
    } else {
      print('Add Patien field');
      throw Exception('Add Patien Failed');
    }
  }
}
