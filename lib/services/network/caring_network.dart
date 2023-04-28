import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/caring_models.dart/add_caring_model.dart';
import '../../model/caring_models.dart/edit_caring_model.dart';
import '../../model/caring_models.dart/get_caring_details.dart';
import '../../model/caring_models.dart/get_caring_model.dart';
import '../../utils.dart/const_and_func.dart';

class CaringApi {
  static Future<List<GetCaringModel>> getCaringApi({
    required String token,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Caring/GetAll');
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('get Caring success');

      return getCaringModelFromJson(response.body);
    } else {
      print('get Caring field');
      throw Exception('get Caring Data Failed');
    }
  }

  ///////////////
  static Future<GetCaringDetailsModel> getCaringDetailsApi({
    required String token,
    required int id,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Caring/GetDetails?id=$id');
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('get Caring success');
      return getCaringDetailsModelFromJson(response.body);
    } else {
      print('get Caring field');
      throw Exception('get Caring Data Failed');
    }
  }

//   // ///////////////
  static Future<void> editCaringApi({
    required String token,
    required int nurseId,
    required int patientId,
    required int caringTypeId,
    required String time,
    required String description,
    required int id,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Caring/Edit/$id');
    var response = await client.post(
      uri,
      body: jsonEncode(EditCaringModel(
              id: id,
              nurseId: nurseId,
              caringTypeId: caringTypeId,
              patientId: patientId,
              description: description,
              time: time)
          .toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('edit Caring success');
    } else {
      print('edit Caring field');
      throw Exception('Edit Caring Data Failed');
    }
  }

//   // ///////////////
  static Future<void> addCaringApi({
    required String token,
    required int nurseId,
    required int patientId,
    required int caringTypeId,
    required String time,
    required String description,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/Caring/Create');
    var response = await client.post(
      uri,
      body: jsonEncode(AddCaringModel(
        nurseId: nurseId,
        patientId: patientId,
        caringTypeId: caringTypeId,
        time: time,
        description: description,
      ).toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Add Caring success');
    } else {
      print('Add Caring field');
      throw Exception('Add Caring Failed');
    }
  }
}
