import 'package:e_nurse_jobs/services/network/nurse_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../model/nurse_models/get_nurses_model.dart';
import '../../routes/routes.dart';
import '../../utils.dart/const_and_func.dart';
import '../../utils.dart/snack_bar_notifi.dart';

class NurseController extends GetxController {
  bool isNoInternetConnection = false;
  bool isCircleShown = false;
  bool isMale = true;
  bool isResigned = true;

//////////////////////////////
  void changeIsMale(bool isMale) {
    this.isMale = isMale;
    update();
  }

  ///////////////////////////
  //////////////////////////////
  void changeisResigned(bool isResigned) {
    this.isResigned = isResigned;
    update();
  }

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
    // TODO: implement onInit
    super.onInit();
    await getNurseData(token: token);
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

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////
  GetNursesDataModel? nurseDetailsData;

  Future<void> getDetailsNurseData(
      {required String token, required int id}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      print('connection');
      try {
        await NurseApi.getNurseDetailsApi(token: token, id: id)
            .then((value) async {
          nurseDetailsData = value;
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

  //////////////////////////////////////////////////////////////////////////////
  Future<void> editNurseData(
      {required String token,
      required String name,
      required String phone,
      required int id,
      required bool gender,
      required bool isResigned}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      try {
        await NurseApi.editNurseApi(
                token: token,
                name: name,
                phone: phone,
                id: id,
                gender: gender,
                isResigned: isResigned)
            .then((value) async {
          hideCircleIndicator();
          snackBarNotifi(
            title: 'EditNurse Data Success',
            color: Colors.green,
          );
          Get.offNamed(Routes.nursePage);
          await getNurseData(token: token);
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

  //////////////////////////////////////////////////////////////////////////////
  Future<void> addNurse(
      {required String token,
      required String name,
      required String phone,
      required bool gender,
      required bool isResigned}) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;
    if (result) {
      try {
        await NurseApi.addNurseApi(
                token: token,
                name: name,
                phone: phone,
                gender: gender,
                isResigned: isResigned)
            .then((value) async {
          hideCircleIndicator();
          snackBarNotifi(
            title: 'Add Nurse Success',
            color: Colors.green,
          );
          Get.offNamed(Routes.nursePage);
          await getNurseData(token: token);
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
