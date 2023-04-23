import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../routes/routes.dart';
import '../../services/network/auth_network.dart';
import '../../utils.dart/snack_bar_notifi.dart';

class AuthController extends GetxController {
  bool isLogin = false;
  bool isCircleShown = false;
  bool hidePassword = true;

  GetStorage tokenBox = GetStorage();
  GetStorage authBox = GetStorage();

  void changeHidePassword() {
    hidePassword = !hidePassword;
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

  Future<void> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;

    if (result) {
      try {
        await AuthApi.registerApi(
                email: email, password: password, userName: userName)
            .then((value) async {
          hideCircleIndicator();
          snackBarNotifi(
            title: 'Register succeeded',
            color: Colors.green,
          );
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

  // // login

  Future<void> logIn({
    required String userName,
    required String password,
  }) async {
    showCircleIndicator();
    var result = await InternetConnectionChecker().hasConnection;

    if (result) {
      try {
        await AuthApi.logInAPI(userName: userName, password: password)
            .then((value) async {
          tokenBox.write('token', value);
          isLogin = true;
          authBox.write('auth', isLogin);
          hideCircleIndicator();
          Get.offAllNamed(Routes.homeScreen);
          snackBarNotifi(
            title: 'LogIn succeeded',
            color: Colors.green,
          );
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

/////////////////////////////////////
  void logOut() {
    tokenBox.remove('token');
    isLogin = false;
    authBox.write('auth', isLogin);
    Get.offAllNamed(Routes.welcomeScreen);
    print('logout');
  }
}
