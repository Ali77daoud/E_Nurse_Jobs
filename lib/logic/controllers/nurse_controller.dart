import 'package:e_nurse_jobs/services/network/app_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../model/app_models/get_nurses_model.dart';
import '../../utils.dart/const_and_func.dart';
import '../../utils.dart/snack_bar_notifi.dart';

class NurseController extends GetxController {
  bool isNoInternetConnection = false;
  bool isCircleShown = false;

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
        await AppApi.getNurseApi(token: token).then((value) async {
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

}
