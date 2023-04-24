import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/caring_type_models.dart/add_caring_type_model.dart';
import '../../model/caring_type_models.dart/edit_caring_type_model.dart';
import '../../model/caring_type_models.dart/get_caring_type_model.dart';
import '../../utils.dart/const_and_func.dart';

class CaringTypeApi {
  static Future<GetCaringTypeModel> getCaringTypeApi({
    required String token,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/CaringType/GetAll');
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('get CaringType success');
      final responseData = json.decode(response.body);
      return GetCaringTypeModel.fromJson(responseData);
    } else {
      print('get CaringType field');
      throw Exception('get CaringType Data Failed');
    }
  }

  ///////////////
  static Future<GetCaringTypeDataModel> getCaringTypeDetailsApi({
    required String token,
    required int id,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/CaringType/GetDetails?id=$id');
    var response = await client.get(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('get CaringType success');
      final responseData = json.decode(response.body);
      return GetCaringTypeDataModel.fromJson(responseData['obj']);
    } else {
      print('get CaringType field');
      throw Exception('get CaringType Data Failed');
    }
  }

  // ///////////////
  static Future<void> editCaringTypeApi({
    required String token,
    required String name,
    required String description,
    required int id,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/CaringType/Edit/$id');
    var response = await client.post(
      uri,
      body: jsonEncode(EditCaringTypeModel(
        id: id,
        name: name,
        description: description,
      ).toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('edit CaringType success');
    } else {
      print('edit CaringType field');
      throw Exception('Edit CaringType Data Failed');
    }
  }

  // ///////////////
  static Future<void> addCaringTypeApi({
    required String token,
    required String name,
    required String description,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/CaringType/Create');
    var response = await client.post(
      uri,
      body: jsonEncode(AddCaringTypeModel(
        name: name,
        description: description,
      ).toJson()),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Add CaringType success');
    } else {
      print('Add CaringType field');
      throw Exception('Add CaringType Failed');
    }
  }
}
