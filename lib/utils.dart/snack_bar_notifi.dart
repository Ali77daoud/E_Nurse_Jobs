import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

SnackbarController snackBarNotifi(
    {required String title, required Color color}) {
  return Get.snackbar(title, '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: AppColors.white,
      margin: const EdgeInsets.all(0),
      borderRadius: 0,
      duration: const Duration(seconds: 3));
}
