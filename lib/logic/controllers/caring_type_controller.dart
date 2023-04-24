import 'package:e_nurse_jobs/services/network/caring_type_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../model/caring_type_models.dart/get_caring_type_model.dart';
import '../../routes/routes.dart';
import '../../utils.dart/const_and_func.dart';
import '../../utils.dart/snack_bar_notifi.dart';

class CaringTypeController extends GetxController {
  bool isNoInternetConnection = false;
  bool isCircleShown = false;

  ///////////////////////////
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
    await getCaringTypeData(token: token);
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

  // //////////////////////////////////////////////////////////////////////////////
  // //////////////////////////////////////////////////////
  GetCaringTypeDataModel? caringTypeDetailsData;

  Future<void> getDetailsCaringTypeData(
      {required String token, required int id}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      try {
        await CaringTypeApi.getCaringTypeDetailsApi(token: token, id: id)
            .then((value) async {
          caringTypeDetailsData = value;
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

  // //////////////////////////////////////////////////////////////////////////////
  Future<void> editCaringTypeData({
    required String token,
    required String name,
    required String description,
    required int id,
  }) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      try {
        await CaringTypeApi.editCaringTypeApi(
                token: token, name: name, description: description, id: id)
            .then((value) async {
          hideCircleIndicator();
          snackBarNotifi(
            title: 'Edit CaringType Data Success',
            color: Colors.green,
          );
          Get.offNamed(Routes.caringTypePage);
          await getCaringTypeData(token: token);
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

  // //////////////////////////////////////////////////////////////////////////////
  Future<void> addCaringType({
    required String token,
    required String name,
    required String description,
  }) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      try {
        await CaringTypeApi.addCaringTypeApi(
                token: token, name: name, description: description)
            .then((value) async {
          hideCircleIndicator();
          snackBarNotifi(
            title: 'Add CaringType Success',
            color: Colors.green,
          );
          Get.offNamed(Routes.caringTypePage);
          await getCaringTypeData(token: token);
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
}
