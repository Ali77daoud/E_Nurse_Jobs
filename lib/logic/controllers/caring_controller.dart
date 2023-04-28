import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../model/caring_models.dart/get_caring_details.dart';
import '../../model/caring_models.dart/get_caring_model.dart';
import '../../model/caring_type_models.dart/get_caring_type_model.dart';
import '../../model/nurse_models/get_nurses_model.dart';
import '../../model/patient_model/get_patient_model.dart';
import '../../routes/routes.dart';
import '../../services/network/caring_network.dart';
import '../../services/network/caring_type_network.dart';
import '../../services/network/nurse_network.dart';
import '../../services/network/patient_network.dart';
import '../../utils.dart/const_and_func.dart';
import '../../utils.dart/snack_bar_notifi.dart';

class CaringController extends GetxController {
  bool isNoInternetConnection = false;
  bool isCircleShown = false;

  String nurseId = '';
  final List<String> nurseNames = [''];
  ///////////////////////////
  String patientId = '';
  final List<String> patientNames = [''];
  ///////////////////////////
  String caringTypeId = '';
  final List<String> caringTypeNames = [''];
  ///////////////////////////
  String? date;

  void changenurseId(String nurseId) {
    this.nurseId = nurseId;
    update();
  }

////////////////////////
  void changeDate(String date) {
    this.date = date;
    update();
  }

  void showCircleIndicator() {
    isCircleShown = true;
    update();
  }

  void hideCircleIndicator() {
    isCircleShown = false;
    update();
  }

  /////////////////////////
  ///////////////////////////////////////////////////
  void showNoInternetPage() {
    isNoInternetConnection = true;
    update();
  }

  void hideNoInternetPage() {
    isNoInternetConnection = false;
    update();
  }

  /////////////////////////////////////////////////////
  @override
  void onInit() async {
    super.onInit();
    await getCaringData(token: token);
  }

  //////////////////////////////////////////////////////
  List<GetCaringModel>? caringData;

  Future<void> getCaringData({required String token}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      try {
        await CaringApi.getCaringApi(token: token).then((value) async {
          caringData = value;
          hideCircleIndicator();
          hideNoInternetPage();
          update();
        });
      } catch (e) {
        String title = e.toString().replaceAll('Exception: ', ' ');
        print(title);
        hideCircleIndicator();
        showNoInternetPage();
        snackBarNotifi(
            title: title, color: const Color.fromARGB(255, 158, 15, 5));
      }
    } else {
      print('no connection');
      hideCircleIndicator();
      showNoInternetPage();
    }
    update();
  }

  // // //////////////////////////////////////////////////////////////////////////////
  // // //////////////////////////////////////////////////////
  GetCaringDetailsModel? caringDetailsData;

  Future<void> getDetailsCaringData(
      {required String token, required int id}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      try {
        await CaringApi.getCaringDetailsApi(token: token, id: id)
            .then((value) async {
          caringDetailsData = value;
          hideCircleIndicator();
          hideNoInternetPage();
          update();
        });
      } catch (e) {
        String title = e.toString().replaceAll('Exception: ', ' ');
        print(title);
        hideCircleIndicator();
        showNoInternetPage();
        snackBarNotifi(
            title: title, color: const Color.fromARGB(255, 158, 15, 5));
      }
    } else {
      print('no connection');
      hideCircleIndicator();
      showNoInternetPage();
    }
    update();
  }

  // // //////////////////////////////////////////////////////////////////////////////
  Future<void> editCaringData({
    required String token,
    required int nurseId,
    required int patientId,
    required int caringTypeId,
    required String time,
    required String description,
    required int id,
  }) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      try {
        await CaringApi.editCaringApi(
                token: token,
                nurseId: nurseId,
                patientId: patientId,
                caringTypeId: caringTypeId,
                time: time,
                description: description,
                id: id)
            .then((value) async {
          hideCircleIndicator();
          snackBarNotifi(
            title: 'Edit Caring Data Success',
            color: Colors.green,
          );
          Get.offNamed(Routes.caringPage);
          await getCaringData(token: token);
          update();
        });
      } catch (e) {
        String title = e.toString().replaceAll('Exception: ', ' ');
        print(title);
        hideCircleIndicator();
        snackBarNotifi(
            title: title, color: const Color.fromARGB(255, 158, 15, 5));
      }
    } else {
      print('no connection');
      hideCircleIndicator();
      snackBarNotifi(
          title: 'No Internet Connection',
          color: const Color.fromARGB(255, 158, 15, 5));
      update();
    }
  }

  // // //////////////////////////////////////////////////////////////////////////////
  Future<void> addCaring({
    required String token,
    required int nurseId,
    required int patientId,
    required int caringTypeId,
    required String time,
    required String description,
  }) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      try {
        await CaringApi.addCaringApi(
                token: token,
                nurseId: nurseId,
                patientId: patientId,
                caringTypeId: caringTypeId,
                time: time,
                description: description)
            .then((value) async {
          hideCircleIndicator();
          snackBarNotifi(
            title: 'Add Caring Success',
            color: Colors.green,
          );
          Get.offNamed(Routes.caringPage);
          await getCaringData(token: token);
          update();
        });
      } catch (e) {
        String title = e.toString().replaceAll('Exception: ', ' ');
        print(title);
        hideCircleIndicator();
        snackBarNotifi(
            title: title, color: const Color.fromARGB(255, 158, 15, 5));
      }
    } else {
      print('no connection');
      hideCircleIndicator();
      snackBarNotifi(
          title: 'No Internet Connection',
          color: const Color.fromARGB(255, 158, 15, 5));
      update();
    }
  }

  //////////////////////////////////////////////////////
  GetNursesModel? nurseData;

  Future<void> getNurseData({required String token}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      try {
        await NurseApi.getNurseApi(token: token).then((value) async {
          nurseData = value;
          hideCircleIndicator();
          hideNoInternetPage();
          update();
        });
      } catch (e) {
        String title = e.toString().replaceAll('Exception: ', ' ');
        print(title);
        hideCircleIndicator();
        showNoInternetPage();
        snackBarNotifi(
            title: title, color: const Color.fromARGB(255, 158, 15, 5));
      }
    } else {
      print('no connection');
      hideCircleIndicator();
      showNoInternetPage();
    }
    update();
  }

  //////////////////////////////////////////////////////
  GetPatientModel? patientData;

  Future<void> getPatientData({required String token}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      try {
        await PatientApi.getPatientApi(token: token).then((value) async {
          patientData = value;
          hideCircleIndicator();
          hideNoInternetPage();
          update();
        });
      } catch (e) {
        String title = e.toString().replaceAll('Exception: ', ' ');
        print(title);
        hideCircleIndicator();
        showNoInternetPage();
        snackBarNotifi(
            title: title, color: const Color.fromARGB(255, 158, 15, 5));
      }
    } else {
      print('no connection');
      hideCircleIndicator();
      showNoInternetPage();
    }
    update();
  }

  //////////////////////////////////////////////////////
  GetCaringTypeModel? caringTypeData;

  Future<void> getCaringTypeData({required String token}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      try {
        await CaringTypeApi.getCaringTypeApi(token: token).then((value) async {
          caringTypeData = value;
          hideCircleIndicator();
          hideNoInternetPage();
          update();
        });
      } catch (e) {
        String title = e.toString().replaceAll('Exception: ', ' ');
        print(title);
        hideCircleIndicator();
        showNoInternetPage();
        snackBarNotifi(
            title: title, color: const Color.fromARGB(255, 158, 15, 5));
      }
    } else {
      print('no connection');
      hideCircleIndicator();
      showNoInternetPage();
    }
    update();
  }
}
